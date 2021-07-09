import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/elements/red_button.dart';
import 'package:live_com/screens/system/dialog_helpers.dart';
import 'package:live_com/screens/system/system_header.dart';
import 'package:live_com/theme.dart';

class DeactivateAccountPage extends StatelessWidget {
  const DeactivateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSellerProfileBackgroundColor,
        body: Column(
          children: [
            SystemBaseAppBar(
              title: 'Deactivate Account',
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                    text: TextSpan(
                        text:
                            'We are sorry to hear that you have chosen to deactivate your LiveCom account. If there is anything we can assist you with, please do not hesitate to contact us.\n\n',
                        style: kBody2TextStyle,
                        children: <TextSpan>[
                      TextSpan(
                        text: 'IMPORTANT\n',
                        style: kBody2TextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'Please do keep in mind that you will not be able to reactivate your account or retrieve any of the content or information you have added.\n\nIf you would still like your account deactivated, click "DEACTIVATE"',
                        style: kBody2TextStyle,
                      ),
                    ]))),
            Spacer(),
            GestureDetector(
                onTap: () => triggerSystemDialog(context,
                    buildPasswordDialog(context, MediaQuery.of(context).size)),
                child: RedButton(
                  text: 'DEACTIVATE',
                )),
            SizedBox(
              height: 24,
            )
          ],
        ));
  }
}
