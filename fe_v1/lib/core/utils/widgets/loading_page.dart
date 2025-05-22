import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/color_base.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 6.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorBase.blue,
            ),
          ),
        ),
      ),
    );
  }
}
