import 'package:flutter/material.dart';
import 'package:unsplash/SliversGridPage.dart';
import 'package:unsplash/SliversListPage.dart';
import 'package:unsplash/UnsplashMainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: UnsplashMainPage(),
      //home: SliversListPage(),
      home: SliversGridPage(),
    );
  }
}
