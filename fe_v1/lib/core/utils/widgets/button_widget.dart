import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class ButtonWidget extends StatelessWidget {
  final Color colorBtn;
  final Color colorText;
  final double sizeText;
  final double widthBtn;
  final FontWeight fontWeight;
  final String title;
  final double heightBtn;
  final VoidCallback? onClick;

  const ButtonWidget({
    super.key,
    this.colorBtn = const Color(0xFF3FA5D1),
    this.colorText = Colors.white,
    this.widthBtn = 300,
    this.fontWeight = FontWeight.w400,
    this.sizeText = 23,
    this.heightBtn = 50,
    this.onClick = null,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthBtn,
      height: heightBtn,
      child: ElevatedButton(
        onPressed: onClick ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBtn, // Màu nền
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bo góc
          ),
        ),
        child: TextLeagueSpartan(
          title: title,
          size: sizeText,
          weight: fontWeight,
          color: colorText,
        ),
      ),
    );
  }
}
