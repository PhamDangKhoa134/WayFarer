import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class WellcomeCenter extends StatelessWidget {
  final String linkImage;
  final double width;
  final Color color;

  const WellcomeCenter(
      {super.key,
      required this.linkImage,
      required this.width,
      required this.color});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          linkImage,
          width: width,
        ), // Hình ảnh
        const SizedBox(height: 40),

        TextLeagueSpartan(
          title: 'WAY FARER',
          size: SizeBase.sizeBaseH1,
          weight: FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}
