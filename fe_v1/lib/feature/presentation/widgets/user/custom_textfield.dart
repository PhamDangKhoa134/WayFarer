import 'package:flutter/material.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final Color borderColor;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? title;
  final double sizeTitle;
  final VoidCallback? onTap;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.borderColor = const Color(0xFF5E5E5E),
    this.onChanged,
    this.validator,
    this.title,
    this.sizeTitle = SizeBase.sizeBaseH6,
    this.onTap,
  }) : super(key: key);
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextLeagueSpartan(
        title: widget.title ?? '',
        size: widget.sizeTitle,
        weight: FontWeight.w500,
      ),
      TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        style: TextStyle(color: const Color(0xFF8E8E8E)),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: const Color(0xFF8E8E8E)),
          filled: true,
          fillColor: const Color(0xFFE5E5E5),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: widget.borderColor)
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: widget.borderColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: widget.borderColor, width: 1),
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
      )
    ]);
  }
}
