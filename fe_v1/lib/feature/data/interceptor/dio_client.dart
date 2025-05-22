import 'package:dio/dio.dart';
import 'package:fe_v1/core/exceptions/dio_error_handle.dart';
import 'package:fe_v1/feature/data/interceptor/auth_interceptor.dart';

class DioClient {
  static final Dio _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      }));

  static Dio getDio() {
    print("Interceptor");
    _dio.interceptors.clear();
    _dio.interceptors.add(Authinterceptor(_dio));
    return _dio;
  }

  // GET
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await getDio().get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw DioErrorHandle.handleError(e);
    }
  }

  // POST
  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await getDio().post(path, data: data);
    } on DioException catch (e) {
      throw DioErrorHandle.handleError(e);
    }
  }

  // PUT
  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await getDio().put(path, data: data);
    } on DioException catch (e) {
      throw DioErrorHandle.handleError(e);
    }
  }

  // PATCH
  Future<Response> patch(String path, {dynamic data}) async {
    try {
      return await getDio().patch(path, data: data);
    } on DioException catch (e) {
      throw DioErrorHandle.handleError(e);
    }
  }

  // DELETE
  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await getDio().delete(path, data: data);
    } on DioException catch (e) {
      throw DioErrorHandle.handleError(e);
    }
  }
}
