import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api_exceptions.dart';
import 'package:hungry_app/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();
  //CRUD METHODS

  //GET
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioError catch (e) {
      ApiExceptions.handleError(e);
    }
  }
  //POST

  //PUT OR UPDATE

  //DELETE
}
