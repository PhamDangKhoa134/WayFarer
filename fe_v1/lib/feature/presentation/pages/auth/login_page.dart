import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/core/utils/notifications.dart';
import 'package:fe_v1/core/utils/validators.dart';
import 'package:fe_v1/core/utils/widgets/opacity_widget.dart';
import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_event.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_state.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_app_bar.dart';
import 'package:fe_v1/feature/presentation/widgets/user/custom_textfield.dart';
import 'package:fe_v1/core/utils/widgets/button_widget.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Notifications.success(context, state.sucess);
            GoRouter.of(context).goNamed(homeRoute, extra: 0);
          } else if (state is AuthError) {
            Notifications.error(context, state.error);
            GoRouter.of(context).goNamed(logInRoute, extra: 0);
          }
          Future.delayed(const Duration(seconds: 5), () {
              GoRouter.of(context).goNamed(homeRoute, extra: 0);
          });
        },
        builder: (context, state) {
          return OpacityWidget(
            isOpacityEnabled: state is AuthLoading,
            child: CustomScrollView(
              slivers: [
                CustomAppBar(
                  title: "LOG IN",
                  onBack: () => GoRouter.of(context).goNamed(welComeRoute),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        SizedBox(height: 40),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                title: "Email",
                                hintText: "example@gmail.com",
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: Icons.email_outlined,
                                validator: (value) =>
                                    Validators.validEmail(value),
                              ),
                              SizedBox(height: 16),
                              CustomTextField(
                                title: "Mật khẩu",
                                hintText: "**********",
                                controller: passwordController,
                                obscureText: true,
                                prefixIcon: Icons.lock_outline,
                                suffixIcon: Icon(Icons.visibility_off),
                                validator: (value) =>
                                    Validators.checkNullOrEmpty(value),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () => GoRouter.of(context)
                                        .goNamed(emailRoute),
                                    child: const TextLeagueSpartan(
                                      title: "Forget Password",
                                      size: SizeBase.sizeSmall,
                                      weight: FontWeight.w500,
                                      color: ColorBase.blue,
                                    ),
                                  )),
                              const SizedBox(height: 40),
                              ButtonWidget(
                                title: "Log In",
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          LoginRequest(
                                            dto: LoginDto(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          ),
                                        );
                                  }
                                },
                                // onClick: () => GoRouter.of(context).goNamed(homeRoute),
                              ),
                              SizedBox(height: 40),
                              const TextLeagueSpartan(
                                title: "or sign up with",
                                size: SizeBase.sizeBaseP,
                                weight: FontWeight.w300,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.facebook,
                                        color: ColorBase.blue, size: 30),
                                    onPressed: () {
                                      print("Đăng nhập bằng Facebook");
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.google,
                                        color: Colors.red, size: 30),
                                    onPressed: () {
                                      print("Đăng nhập bằng Google");
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const TextLeagueSpartan(
                                    title: "Don't have account?",
                                    size: SizeBase.sizeBaseP,
                                    weight: FontWeight.w300,
                                  ),
                                  TextButton(
                                    onPressed: () => GoRouter.of(context)
                                        .goNamed(signUpRoute),
                                    child: const TextLeagueSpartan(
                                      title: "Sign Up",
                                      size: SizeBase.sizeBaseP,
                                      weight: FontWeight.w500,
                                      color: ColorBase.blue,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 200),
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
