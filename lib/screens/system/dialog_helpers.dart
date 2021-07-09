import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/elements/red_button.dart';
import 'package:live_com/screens/seller_profile/seller_profile.dart';
import 'package:live_com/screens/system/system_view_model.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

void triggerSystemDialog(BuildContext context, Widget child,
    {bool containsIllustration = false, Widget? icon}) {
  final deviceSize = MediaQuery.of(context).size;

  if (containsIllustration) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(padding: EdgeInsets.only(top: 40), child: child),
                Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(deviceSize.width * .15),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(
                                7,
                                7,
                              ),
                              blurRadius: 20,
                              color: Colors.black.withOpacity(.4))
                        ]),
                    child: DialogBlurIllustration(
                      icon: icon,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  } else
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: child,
              backgroundColor: Colors.transparent,
            ));
}

class DialogBlurIllustration extends StatelessWidget {
  final Widget? icon;
  const DialogBlurIllustration({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(deviceSize.width * .3),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          height: deviceSize.width * .3,
          width: deviceSize.width * .3,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            kTextColor.withOpacity(.25),
            Color(0xFF7889A9).withOpacity(.25)
          ])),
          child: icon,
        ),
      ),
    );
  }
}

Widget buildPasswordDialog(BuildContext context, Size deviceSize) {
  final child = Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            kTextColor.withOpacity(.25),
            Color(0xFF7889A9).withOpacity(.25)
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter Password',
            style: kHeaderTextStyle.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'For your security, please re-enter your password to continue.',
            textAlign: TextAlign.center,
            style: kBody1TextStyle,
          ),
          SizedBox(
            height: 24,
          ),
          SearchBar(
            hintText: 'Password',
            isInDialog: true,
          ),
          SizedBox(
            height: 56,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceSize.width * .1),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    triggerSystemDialog(context,
                        _buildDeactivationSuccessfulDialog(context, deviceSize),
                        containsIllustration: true,
                        icon: Image.asset(
                          'assets/home/green_check.png',
                        ));
                  },
                  child: RedButton(
                    text: 'CONTINUE',
                  ))),
          SizedBox(
            height: 8,
          )
        ],
      ));

  return _buildBlurWidget(child);
}

Widget _buildDeactivationSuccessfulDialog(
    BuildContext context, Size deviceSize) {
  final content = Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            kTextColor.withOpacity(.25),
            Color(0xFF7889A9).withOpacity(.25)
          ])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: (deviceSize.width * .3 - 48),
          ),
          Text(
            'ACCOUNT DEACTIVATED',
            style: kAnnouncementTextStyle.copyWith(
                fontSize: 32, color: kTextColor),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'We are sad that you have decided to deactivate your account. If you have any further inquiries, please reach out to our Customer Service Team.',
            textAlign: TextAlign.center,
            style: kBody1TextStyle,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * .1),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: RedButton(
                text: 'OK',
              ),
            ),
          ),
        ],
      ));

  return _buildBlurWidget(content);
}

Widget _buildBlurWidget(Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: child,
    ),
  );
}

class CustomDialog extends StatelessWidget {
  final Widget? child;
  const CustomDialog({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(backgroundColor: Colors.transparent, child: child!);
  }
}

void triggerLanguageSheet(BuildContext context) {
  final content = Container(
      padding: EdgeInsets.all(.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kTextColor.withOpacity(.5), Colors.transparent])),
      child: Container(
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
                      'Select Language',
                      style: kTitleTextStyle,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Color(0x80181E28),
                              child: Center(
                                  child: Icon(
                                Icons.close,
                                size: 16,
                                color: kTextColor,
                              )))),
                    ),
                  ],
                )),
            SizedBox(
              height: 4,
            ),
            Consumer<SystemViewModel>(
              builder: (context, systemViewModel, child) => Column(
                children: [
                  for (int i = 0; i < systemViewModel.languages.length; i++)
                    GestureDetector(
                        onTap: () => systemViewModel.updateSelectedLanguage(
                            systemViewModel.languages.keys.elementAt(i)),
                        child: Column(
                          children: [
                            ListTile(
                                title: Text(
                                  systemViewModel.languages.keys.elementAt(i),
                                  style: kBody1TextStyle,
                                ),
                                trailing: systemViewModel.languages.values
                                        .elementAt(i)
                                    ? Icon(Icons.check, color: kTextColor)
                                    : SizedBox()),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              color: Color(0xFF505D75),
                              height: .5,
                            )
                          ],
                        )),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: RedButton(
                  text: 'UPDATE',
                ))
          ],
        ),
      ));
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Wrap(
            children: [content],
          ));
}
