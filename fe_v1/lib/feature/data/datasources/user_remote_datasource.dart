import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fe_v1/core/constants/url_base.dart';
import 'package:fe_v1/core/exceptions/user_exception.dart';
import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/data/dtos/register_dto.dart';
import 'package:fe_v1/feature/data/interceptor/dio_client.dart';
import 'package:fe_v1/feature/domain/entities/user_entity.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final dio = DioClient();
class UserRemoteDatasource {
  Future<UserEntity?> login(LoginDto dto) async {
    Response response;
    const String url = "${UrlBase.baseUrlUser}/login-auth";
    // final prefs = await SharedPreferences.getInstance();
    try {
      response = await dio.post(url, data: dto.toJson());

      UserEntity user = UserEntity.fromJson(response.data['user']);
      // prefs.setString('accessToken', response.data['accessToken']);

      // prefs.setString('refreshToken', response.data['refreshToken']);

      // prefs.setString('user', jsonEncode(response.data['user']));

      return user;
    } on UserException catch (e) {
      throw UserException(message: e.message, status: e.status);
    }
  }

  Future<String?> register(RegisterDto dto) async {
    Response response;
    const String url = "${UrlBase.baseUrlUser}/create-user";
    try {
      print("Url ${url}, dto ${dto.toJson()}");

      response = await dio.post(url, data: dto.toJson());

      return response.data['message'];
    } on UserException catch (e) {
      throw UserException(message: e.message, status: e.status);
    }
  }
}