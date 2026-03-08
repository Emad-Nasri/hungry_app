import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/utils/pref_helper.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  // LOGIN
  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await apiService.post('/login', {
        'email': email,
        'password': password,
      });

      if (response == null) {
        throw ApiError(message: "Server returned empty response");
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final data = response['data'];

        // إذا السيرفر رجع خطأ
        if (code != 200 || data == null) {
          throw ApiError(message: msg ?? "Login failed");
        }

        final user = UserModel.fromJson(data);

        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }

        return user;
      } else {
        throw ApiError(message: 'Unexpected response format from server');
      }
    }
    // أخطاء Dio
    on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
    // أخطاء API
    on ApiError {
      rethrow;
    }
    // أي خطأ آخر
    catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  // SIGNUP
  Future<UserModel?> signup(String name, String email, String password) async {
    try {
      final response = await apiService.post('/register', {
        'name': name,
        'email': email,
        'password': password,
      });

      if (response is ApiError) {
        throw response;
      }

      if (response is Map<String, dynamic>) {
        final msg = response['message'];
        final code = response['code'];
        final coder = int.tryParse(code);
        final data = response['data'];

        if (coder != 200 && coder != 201) {
          throw ApiError(message: msg ?? 'Unknown error');
        }

        final user = UserModel.fromJson(data);

        if (user.token != null) {
          await PrefHelper.saveToken(user.token!);
        }

        return user;
      } else {
        throw ApiError(message: 'UnExpected Error From Server');
      }
    } on DioError catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
  // GET PROFILE

  // UPDATE PROFILE

  // LOGOUT
}
