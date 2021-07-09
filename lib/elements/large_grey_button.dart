import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/theme.dart';

class LargeGreyButton extends StatelessWidget {
  final String? text;
  final Color? color;
  const LargeGreyButton({Key? key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        width: deviceSize.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: .5, color: kBackgroundColor),
            boxShadow: [
              BoxShadow(
                  blurRadius: 12,
                  offset: Offset(0.0, 12.0),
                  color: Color(0x80000000)),
              BoxShadow(
                  blurRadius: 12,
                  offset: Offset(0.0, -12.0),
                  color: Color(0x0DFFFFFF)),
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF505D75), Color(0xFF1B202B)])),
        child: Center(
            child: Text(
          text!,
          style: kBody1TextStyle.copyWith(
              fontWeight: FontWeight.w600, color: color!),
        )));
  }
}
