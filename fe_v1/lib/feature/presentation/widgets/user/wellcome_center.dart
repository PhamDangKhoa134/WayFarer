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
        TextLeagueSpartan(
          title: 'Skin',
          size: SizeBase.sizeBaseH1,
          color: color,
        ),
        TextLeagueSpartan(
          title: 'Firts',
          size: SizeBase.sizeBaseH1,
          color: color,
        ),
        TextLeagueSpartan(
          title: 'Dermatology center',
          size: SizeBase.sizeBaseH6,
          weight: FontWeight.w600,
          color: color,
        ),
      ],
    );
  }
}
