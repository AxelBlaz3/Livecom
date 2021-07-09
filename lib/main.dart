import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_com/screens/home/home.dart';
import 'package:live_com/screens/home/home_view_model.dart';
import 'package:live_com/screens/seller_profile/seller_profile.dart';
import 'package:live_com/screens/seller_profile/seller_provider_viewmodel.dart';
import 'package:live_com/screens/system/system.dart';
import 'package:live_com/screens/system/system_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SellerProfileViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SystemViewModel(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SystemPage());
  }
}
