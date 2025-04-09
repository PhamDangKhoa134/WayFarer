import 'dart:convert';
import 'package:fe/src/comman/api.dart';
import 'package:http/http.dart' as http;
import '../../model/login_response.dart';

class AuthRemoteDataSource {
  final String baseUrl = API.LOGIN;

  Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Đăng nhập thất bại");
    }
  }
}
