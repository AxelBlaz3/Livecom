import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/models/person.dart';
import 'package:live_com/screens/system/system_header.dart';
import 'package:live_com/theme.dart';

class BlockListPage extends StatelessWidget {
  const BlockListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSellerProfileBackgroundColor,
        body: Column(
          children: [
            SystemBaseAppBar(
              title: 'Blocklist',
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: blockList.length,
                    itemBuilder: (context, index) => BlockListItem(
                          person: blockList[index],
                        )))
          ],
        ));
  }
}

class BlockListItem extends StatelessWidget {
  final Person? person;
  const BlockListItem({Key? key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Image.asset(
              person!.imagePath!,
              height: 48,
              width: 48,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              person!.name!,
              style: kBody1TextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            TextButton(
                onPressed: () => print(''),
                child: Text(
                  'UNBLOCK',
                  style: kBody2TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFEC0000),
                      decoration: TextDecoration.underline),
                )),
            SizedBox(
              width: 16,
            )
          ],
        ));
  }
}
