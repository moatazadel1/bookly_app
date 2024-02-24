import 'package:bookly_app/core/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(EndPoint.baseUrl + endPoint);
    return response.data;
  }
}
