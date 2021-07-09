import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_com/elements/red_button.dart';
import 'package:live_com/elements/share_button.dart';
import 'package:live_com/theme.dart';

import 'colors.dart';

void showAlert(BuildContext context, String description) {
  //final black80 = Color(0xFF000000).withOpacity(opacity);
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    backgroundColor: Colors.black.withOpacity(.8),
    content: Text(
      description,
      style: kBody2TextStyle,
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

void triggerBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(
            children: [
              Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                            kTextColor.withOpacity(.5),
                            Colors.transparent,
                          ])),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 16, bottom: 32),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      child: child))
            ],
          ));
}

void triggerBlockAlertDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final dialogBody = Container(
      padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10)],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x40D7DDE8), Color(0x407889A9)]),
          borderRadius: BorderRadius.circular(8)),
      width: size.width * .85,
      child: Column(
        children: [
          SizedBox(
            height: size.width * .85 / 4,
          ),
          Text(
            'BLOCK',
            style: kAnnouncementTextStyle.copyWith(
                color: Color(0xFFEC0000), fontSize: 44),
          ),
          SizedBox(
            height: 16,
          ),
          Text('You have blocked this Seller', style: kBody1TextStyle),
          SizedBox(
            height: 48,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 56),
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: RedButton(
                    text: 'DISMISS',
                  )))
        ],
      ));

  final dialogIllustration = Container(
    height: size.width * .3,
    width: size.width * .3,
    alignment: Alignment.center,
    child: Image.asset('assets/block.png',
        height: size.width * .17, width: size.width * .17),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(63.5),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x40D7DDE8), Color(0x407889A9)])),
  );

  final content = Container(
      height: size.height,
      width: size.width,
      child: Stack(alignment: Alignment.center, children: [
        Wrap(
          children: [
            dialogBody,
          ],
        ),
        Positioned(
            child: Container(
              width: size.width * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * .15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(size.width * .03, size.width * .03),
                        color: Color(0x40000000))
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * .15),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: dialogIllustration)),
            ),
            top: (size.height / 2 -
                (size.width * .3 / 3) -
                (size.width * .85 / 2)))
      ]));
  showDialog(
    context: context,
    builder: (context) => content,
  );
}

void triggerReportAlertDialog(BuildContext context) {
  final size = MediaQuery.of(context).size;

  final dialogBody = Container(
      padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10)],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x40D7DDE8), Color(0x407889A9)]),
          borderRadius: BorderRadius.circular(8)),
      width: size.width * .85,
      child: Column(
        children: [
          SizedBox(
            height: size.width * .85 / 4,
          ),
          Text(
            'REPORT',
            style: kAnnouncementTextStyle.copyWith(
                color: Color(0xFFEC0000), fontSize: 44),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Thank you for your report. We will investigate this matter.',
            style: kBody1TextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 48,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 56),
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: RedButton(
                    text: 'DISMISS',
                  )))
        ],
      ));

  final dialogIllustration = Container(
    height: size.width * .3,
    width: size.width * .3,
    alignment: Alignment.center,
    child: Image.asset('assets/report.png',
        height: size.width * .17, width: size.width * .17),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(63.5),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x40D7DDE8), Color(0x407889A9)])),
  );

  final content = Container(
      height: size.height,
      width: size.width,
      child: Stack(alignment: Alignment.center, children: [
        Wrap(
          children: [
            dialogBody,
          ],
        ),
        Positioned(
            child: Container(
              width: size.width * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * .15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        offset: Offset(size.width * .03, size.width * .03),
                        color: Color(0x40000000))
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * .15),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: dialogIllustration)),
            ),
            top: (size.height / 2 -
                (size.width * .3 / 2.5) -
                (size.width * .85 / 2)))
      ]));
  showDialog(
    context: context,
    builder: (context) => content,
  );
}

void triggerShareSheet(BuildContext context) {
  final content = Container(
    padding: EdgeInsets.symmetric(vertical: 24),
    decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    child: Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Share with friends & family!',
                  style: kTitleTextStyle,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: CircleAvatar(
                          backgroundColor: Color(0x80181E28),
                          child: Center(
                              child: Icon(
                            Icons.close,
                            color: kTextColor,
                          )))),
                ),
              ],
            )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for (var i = 0; i < 4; i++)
            ShareButton(
              index: i,
            ),
        ]),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 4; i < 8; i++)
              ShareButton(
                index: i,
              )
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 16, top: 4),
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () => {},
              child: Image.asset(
                'assets/seller_profile/share_more.png',
                height: 28,
                width: 56,
              )),
        )
      ],
    ),
  );
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Wrap(
            children: [content],
          ));
}
