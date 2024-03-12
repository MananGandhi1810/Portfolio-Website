import 'package:dio/dio.dart';

class DioService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }

  Future<Response> post(String url, dynamic data) async {
    return await _dio.post(url, data: data);
  }
}