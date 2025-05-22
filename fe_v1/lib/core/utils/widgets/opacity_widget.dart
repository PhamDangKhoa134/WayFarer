import 'package:flutter/material.dart';
import 'package:fe_v1/core/utils/widgets/loading_page.dart';

class OpacityWidget extends StatelessWidget {
  final Widget child;
  final bool isOpacityEnabled;

  const OpacityWidget({
    Key? key,
    required this.isOpacityEnabled,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isOpacityEnabled ? 0.3 : 1,
          child: child,
        ),
        if (isOpacityEnabled) LoadingPage(),
      ],
    );
  }
}
