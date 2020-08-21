import 'package:flutter/material.dart';
import 'package:shop/root/RootPage.dart';
import 'package:shop/utils/AppConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: AppConfig.AppTitle,
      theme: AppConfig.defaultTheme,
      home: RootPage(0),
    );
  }
}
