import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/size_base.dart';

class TextLeagueSpartan extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight weight;
  final Color color;
  final TextAlign align;
  const TextLeagueSpartan(
      {super.key,
      required this.title,
      this.size = SizeBase.sizeBaseP,
      this.weight = FontWeight.w300,
      this.color = Colors.black,
      this.align = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: align, // Căn giữa nội dung nếu xuống dòng
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
      maxLines: null, // không giới hạn số dòng
      softWrap: true, // tự động xuống dòng
      overflow: TextOverflow.visible, // hiển thị đầy đủ nội dung
    );
  }
}
