import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioError error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;
    if (data is Map<String, dynamic> && data['message'] != null) {
      return ApiError(message: data['message'], statusCode: statusCode);
    }
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return ApiError(
          message: 'Connection timeout. Please check your internet connection',
        );
      case DioErrorType.sendTimeout:
        return ApiError(message: 'Request timeout. Please try again');
      case DioErrorType.receiveTimeout:
        return ApiError(message: 'Response timeout. Please try again');
      default:
        return ApiError(
          message: 'An unexpected error occurred. Please try again',
        );
    }
  }
}
