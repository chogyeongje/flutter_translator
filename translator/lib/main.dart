import 'package:flutter/material.dart';
import 'package:translator/selectLang.dart';
import 'package:translator/translatePage.dart';

import 'mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String homeRoute = '/';
  static const String translateRoute = '/translatepage';
  static const String selectLangRoute = '/translatepage/selectLang';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => MainPage(),
        translateRoute: (context) => TranslatePage(),
        selectLangRoute: (context) => SelectLang(),
      },
    );
  }
}

class Routes {
  static goHome(BuildContext context){
    Navigator.popUntil(context, ModalRoute.withName(MyApp.homeRoute));
  }

  static goTranslate(BuildContext context){
    Navigator.pushNamed(context, MyApp.translateRoute);
  }

  static goSelectLang(BuildContext context, bool isSource, String currentLang){
    Navigator.pushNamed(
        context,
        MyApp.selectLangRoute,
        arguments: [isSource, currentLang],
    );
  }

  static goBack(BuildContext context){
//    Navigator.pushNamedAndRemoveUntil(context, MyApp.translateRoute, (route) => false, arguments: [isSource, selectLang]);
    Navigator.pushNamed(context, MyApp.translateRoute);
  }
}