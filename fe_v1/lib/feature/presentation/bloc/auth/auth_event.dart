import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/data/dtos/register_dto.dart';

abstract class AuthEvent {}

class LoginRequest extends AuthEvent {
  final LoginDto dto;
  LoginRequest({required this.dto});
}

class RegisterRequest extends AuthEvent {
  final RegisterDto dto;

  RegisterRequest({required this.dto});
}