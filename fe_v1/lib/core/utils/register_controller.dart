import 'package:flutter/material.dart';

class RegisterController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final dateOfBirth = TextEditingController();
  bool? sex;
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    phoneNumber.dispose();
    dateOfBirth.dispose();
  }
}
