import 'package:flutter/material.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/screens/system/dialog_helpers.dart';
import 'package:live_com/screens/system/system_header.dart';
import 'package:live_com/theme.dart';

class SystemPage extends StatelessWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSellerProfileBackgroundColor,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SystemBaseAppBar(
            title: 'System',
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                'System settings',
                style: kTitleTextStyle,
              )),
          Column(
            children: [
              for (int i = 0; i < systemSettingsList.length; i++)
                GestureDetector(
                    onTap: () => i != 1
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                systemSettingsList.values.elementAt(i)))
                        : triggerLanguageSheet(context),
                    child: SettingsItem(
                      title: systemSettingsList.keys.elementAt(i),
                    ))
            ],
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Text(
                'Support',
                style: kTitleTextStyle,
              )),
          Column(
            children: [
              for (int i = 0; i < supportSettingsList.length; i++)
                GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            supportSettingsList.values.elementAt(i))),
                    child: SettingsItem(
                      title: supportSettingsList.keys.elementAt(i),
                    ))
            ],
          )
        ],
      )),
    );
  }
}

class SystemCategory extends StatelessWidget {
  final String? title;
  final List<String>? settingsList;
  const SystemCategory({Key? key, this.title, this.settingsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Text(
              title!,
              style: kTitleTextStyle,
            )),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                physics: NeverScrollableScrollPhysics(),
                itemCount: settingsList!.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        settingsList![index],
                        style: kBody2TextStyle,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    )))
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String? title;
  const SettingsItem({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title!,
            style: kBody1TextStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xFF7889A9),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 1,
          color: Color(0xFF505D75),
        )
      ],
    );
  }
}
