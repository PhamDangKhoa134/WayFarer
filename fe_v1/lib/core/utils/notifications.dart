import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fe_v1/core/constants/color_base.dart';
import 'package:fe_v1/core/utils/widgets/text_league_spartan.dart';

class Notifications {
  static Container container(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 5, // Độ mờ mạnh hơn
            spreadRadius: 1, // Bóng đổ rộng hơn
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // để nội dung canh trên nếu xuống dòng
        children: [
          FaIcon(icon, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            // Đây là phần quan trọng để Text có thể chiếm không gian và xuống dòng
            child: TextLeagueSpartan(
              title: text,
              color: Colors.white,
              weight: FontWeight.w500,
              align: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  static void success(BuildContext context, String message) {
    showToastWidget(
      container(message, FontAwesomeIcons.circleCheck, ColorBase.success),
      context: context,
      duration: Duration(seconds: 2),
      position: StyledToastPosition.top,
      animation:
          StyledToastAnimation.slideFromTop, // Animation trượt từ trên xuống
      reverseAnimation: StyledToastAnimation.fade,
      animDuration: Duration(milliseconds: 400),
      curve: Curves.easeOutBack, // Animation có độ bật mạnh (back effect)
      reverseCurve: Curves.linear,
    );
  }

  static void error(BuildContext context, String message) {
    showToastWidget(
      container(message, FontAwesomeIcons.circleInfo, ColorBase.error),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.top,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}
