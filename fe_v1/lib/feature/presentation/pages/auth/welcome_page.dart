import 'package:fe_v1/feature/presentation/widgets/user/wellcome_center.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/core/utils/widgets/button_widget.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: [
            WellcomeCenter(
                linkImage: 'assets/images/logo.png',
                width: screenWidth / 3,
                color: const Color.fromARGB(255, 0, 0, 0)),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenWidth * 0.6,
              child: const Center(
                child: TextLeagueSpartan(
                  title:
                      '',
                  weight: FontWeight.w300,
                  align: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              title: "Log In",
              colorText: Colors.white,
              onClick: () => GoRouter.of(context).goNamed(logInRoute),
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonWidget(
              title: "Sign Up",
              onClick: () => GoRouter.of(context).goNamed(signUpRoute),
            )
          ],
        ),
      ),
    );
  }
}
