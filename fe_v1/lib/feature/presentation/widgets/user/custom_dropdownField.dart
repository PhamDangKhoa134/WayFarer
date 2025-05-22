import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String? title;
  final double sizeTitle;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final Color borderColor;
  final VoidCallback? onTap;
  final String? hintText;

  const CustomDropdownField({
    Key? key,
    required this.items,
    this.title,
    this.sizeTitle = SizeBase.sizeBaseH5,
    this.value,
    this.onChanged,
    this.validator,
    this.borderColor = ColorBase.blue,
    this.onTap,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (title != null)
        TextLeagueSpartan(
          title: title!,
          size: sizeTitle,
          weight: FontWeight.w500,
        ),
      DropdownButtonFormField<T>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        onTap: onTap,
        style: TextStyle(color: ColorBase.periwinkleBlue),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: ColorBase.periwinkleBlue),
          filled: true,
          fillColor: ColorBase.lightBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
        dropdownColor: ColorBase.lightBlue,
      ),
    ]);
  }
}
