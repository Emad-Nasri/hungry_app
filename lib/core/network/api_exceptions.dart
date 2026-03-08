import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    // إذا السيرفر رجع رسالة خطأ
    if (data != null && data is Map<String, dynamic>) {
      if (data['message'] != null) {
        return ApiError(
          message: data['message'].toString(),
          statusCode: statusCode,
        );
      }
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout');

      case DioExceptionType.badResponse:
        return ApiError(message: 'Server error');

      default:
        return ApiError(message: 'Unexpected error occurred');
    }
  }
}
