import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/screens/system/system_header.dart';
import 'package:live_com/theme.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSellerProfileBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SystemBaseAppBar(
              title: '',
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Terms & Conditions',
                  style: kHeaderTextStyle.copyWith(fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 16,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Are you wondering where your order is? Or asking yourself if the seller has shipped out your order? Fret not, this article is going to address these two questions and help you understand how to check the status of your Livecom orders.\n\nIn order to check your order status, kindly follow the steps below:\n\n\nStep 1:  Click on Me>My Purchases>To Receive Tab\n\nStep 2:  Tap on the order you would like to check on>Click “View’ under Shipping Information.',
                  style: kBody2TextStyle,
                ))
          ],
        ));
  }
}
