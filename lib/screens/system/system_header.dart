import 'package:flutter/material.dart';
import 'package:live_com/elements/header_back_button.dart';

import '../../colors.dart';
import '../../theme.dart';

class SystemBaseAppBar extends StatelessWidget {
  final String? title;
  const SystemBaseAppBar({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: kBackgroundColor,
            boxShadow: [BoxShadow(offset: Offset(0, 1), blurRadius: 4)]),
        padding: EdgeInsets.symmetric(vertical: 16),
        child: SystemAppBar(title: title,));
  }
}

class SystemAppBar extends StatelessWidget {
  final String? title;
  const SystemAppBar({Key? key, this.title = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        child: AppBar(
            elevation: 0,
            brightness: Brightness.dark,
            title: Text(
              title!,
              style: kHeaderTextStyle,
            ),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            leading: const HeaderBackButton()));
  }
}
