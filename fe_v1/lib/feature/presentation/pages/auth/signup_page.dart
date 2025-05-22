import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/core/utils/format.dart';
import 'package:fe_v1/core/utils/notifications.dart';
import 'package:fe_v1/core/utils/register_controller.dart';
import 'package:fe_v1/core/utils/validators.dart';
import 'package:fe_v1/core/utils/widgets/button_widget.dart';
import 'package:fe_v1/core/utils/widgets/opacity_widget.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';
import 'package:fe_v1/feature/data/dtos/register_dto.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_event.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_state.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_app_bar.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_textfield.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_dropdownField.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final registerController = RegisterController();
  // final TextEditingController firstNameController = TextEditingController();
  // final TextEditingController lastNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController phoneNumberController = TextEditingController();
  // final TextEditingController dateOfBirthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Notifications.success(context, state.sucess);
          } else if (state is AuthError) {
            Notifications.error(context, state.error);
          }
        },
        builder: (context, state) {
          return OpacityWidget(
            isOpacityEnabled: state is AuthLoading,
            child: CustomScrollView(
              slivers: [
                CustomAppBar(
                  title: "SIGN UP",
                  onBack: () => GoRouter.of(context).goNamed(welComeRoute),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                title: "First name",
                                hintText: "Nhập họ của bạn",
                                controller: registerController.firstName,
                                keyboardType: TextInputType.name,
                                prefixIcon: Icons.account_circle_outlined,
                                validator: (value) =>
                                    Validators.checkNullOrEmpty(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Last name",
                                hintText: "Nhập tên của bạn",
                                controller: registerController.lastName,
                                keyboardType: TextInputType.name,
                                prefixIcon: Icons.account_circle_outlined,
                                validator: (value) =>
                                    Validators.checkNullOrEmpty(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Email",
                                hintText: "example@gmail.com",
                                controller: registerController.email,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email_outlined,
                                validator: (value) =>
                                    Validators.checkNullOrEmpty(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Mật khẩu",
                                hintText: "**********",
                                controller: registerController.password,
                                obscureText: true,
                                prefixIcon: Icons.lock_outlined,
                                suffixIcon: Icon(Icons.visibility_off),
                                validator: (value) =>
                                    Validators.validPassword(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Số điện thại",
                                hintText: "0124536589",
                                controller: registerController.phoneNumber,
                                prefixIcon: Icons.phone,
                                keyboardType: TextInputType.number,
                                validator: (value) =>
                                    Validators.validPhoneNumber(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Ngày tháng năm sinh",
                                hintText: "DD/MM/YYYY",
                                controller: registerController.dateOfBirth,
                                prefixIcon: Icons.calendar_today,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickedDate != null) {
                                    registerController.dateOfBirth.text =
                                        Format.formatDateToString(pickedDate);
                                  }
                                },
                                validator: (value) =>
                                    Validators.checkNullOrEmpty(value),
                              ),
                              SizedBox(height: 16),
                              CustomDropdownField<bool>(
                                title: "Giới tính",
                                hintText: "Chọn giới tính",
                                value: registerController.sex,
                                onChanged: (value) {
                                  registerController.sex = value;
                                },
                                items: const [
                                  DropdownMenuItem(
                                      value: true,
                                      child: TextLeagueSpartan(
                                        title: "Nam",
                                        weight: FontWeight.w500,
                                      )),
                                  DropdownMenuItem(
                                      value: false,
                                      child: TextLeagueSpartan(
                                        title: "Nữ",
                                        weight: FontWeight.w500,
                                      )),
                                ],
                              ),
                              
                              SizedBox(height: 20),
                              ButtonWidget(
                                title: "Sign Up",
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          RegisterRequest(
                                            dto: RegisterDto(
                                              sex: registerController.sex,
                                              email:
                                                  registerController.email.text,
                                              password: registerController
                                                  .password.text,
                                              firstName: registerController
                                                  .firstName.text,
                                              lastName: registerController
                                                  .lastName.text,
                                              phoneNumber: registerController
                                                  .phoneNumber.text,
                                              dateOfBirth:
                                                  Format.formatStringToDate(
                                                registerController
                                                    .dateOfBirth.text,
                                              )!,
                                            ),
                                          ),
                                        );
                                  }
                                },
                              ),
                              
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextLeagueSpartan(
                                    title: "already have an account? ",
                                    size: SizeBase.sizeSmall,
                                    weight: FontWeight.w300,
                                  ),
                                  TextButton(
                                    onPressed: () => GoRouter.of(context)
                                        .goNamed(logInRoute),
                                    child: TextLeagueSpartan(
                                      title: "Log in",
                                      size: SizeBase.sizeSmall,
                                      weight: FontWeight.w500,
                                      color: ColorBase.blue,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 200),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
