import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final String? text;
  const RedButton({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
        alignment: Alignment.center,
        width: deviceSize.width,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Color(0xCC000000),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(5, 5)),
              BoxShadow(
                  color: Color(0x66505D75),
                  blurRadius: 20,
                  offset: Offset(-7.0, -7.0))
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFEC0000), Color(0xFF540000)])),
        child: Text(
          text!,
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xFFD7DDE8),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ));
  }
}
