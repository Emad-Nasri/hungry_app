import 'package:dio/dio.dart';
import 'package:hungry_app/core/utils/pref_helper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {'Contant-Tybe': 'application/json'},
    ),
  );
  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
  Dio get dio => _dio;
}
//هاد الكلاس هو المتحكم الرئيسي في كل الفونكشن تبع الapiيلي رح نعملها لقدام