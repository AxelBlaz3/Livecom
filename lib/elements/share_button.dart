import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/theme.dart';

class ShareButton extends StatelessWidget {
  final int? index;
  const ShareButton({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(children: [
      Stack(alignment: Alignment.center, children: [
        Image.asset(
          'assets/seller_profile/share/share_bg.png',
          fit: BoxFit.cover,
          height: deviceSize.width / 4.1,
          width: deviceSize.width / 4.1,
        ),
        Image.asset(
          shareResources.values.elementAt(index!),
          height: 20,
          width: 20,
        )
      ]),
      Text(
        shareResources.keys.elementAt(index!),
        style: kBody2TextStyle,
      )
    ]);
  }
}
