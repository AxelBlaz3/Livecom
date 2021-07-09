import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';

class HeaderBackButton extends StatelessWidget {
  const HeaderBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16,
            color: kIconColor,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(-1, -1),
                    color: Color(0x40000000)),
                BoxShadow(
                    blurRadius: 6,
                    offset: Offset(1, 1),
                    color: Color(0x40000000))
              ],
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  colors: [Color(0xFF505D75), Color(0xFF181E28)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ));
  }
}
