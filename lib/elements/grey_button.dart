import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GreyButton extends StatelessWidget {
  final String? text;
  final String? iconPath;
  const GreyButton({Key? key, this.iconPath, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            // border: Border.all(width: 1, color: Colors.black),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4, offset: Offset(0, 4), color: Color(0x40000000))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF505D75), Color(0xFF1B202B)])),
        child: iconPath == null
            ? Text(text!,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFD7DDE8),
                    fontSize: 14,
                    fontWeight: FontWeight.w600))
            : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(iconPath!),
                SizedBox(
                  width: 8,
                ),
                Text(text!,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFD7DDE8),
                        fontSize: 14,
                        fontWeight: FontWeight.w600))
              ]));
  }
}
