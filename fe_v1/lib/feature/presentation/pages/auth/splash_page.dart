import 'package:fe_v1/feature/presentation/widgets/user/wellcome_center.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/route/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2), () => GoRouter.of(context).goNamed(welComeRoute));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorBase.blue, // Màu nền xanh dương
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: [
            WellcomeCenter(
                linkImage: 'assets/images/logo.png',
                width: screenWidth / 3,
                color: Colors.white)
          ],
        ),
      ),
    );
  }
}
