import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';

class BaseDialog extends StatelessWidget {
  final Widget? child;
  const BaseDialog({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: kBackgroundColor,
          child: child,
        ),
      ),
    ));
  }
}
