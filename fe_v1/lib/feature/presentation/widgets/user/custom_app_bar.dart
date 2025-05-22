import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/constants/size_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final VoidCallback? onBack;
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.backgroundColor = Colors.white,
    this.onBack,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: backgroundColor,
      leading: Container(
        padding: const EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon:
              Icon(FontAwesomeIcons.angleLeft, size: 25, color: ColorBase.blue),
          onPressed: onBack,
        ),
      ),
      title: TextLeagueSpartan(
        title: title,
        size: SizeBase.sizeBaseH4,
        weight: FontWeight.w600,
        color: ColorBase.blue,
      ),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
