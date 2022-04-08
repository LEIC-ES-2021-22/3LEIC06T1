import 'package:esof/pages/mainPage.dart';
import 'package:esof/pages/splashPage.dart';
import 'package:esof/widgets/iconFont.dart';
import 'package:flutter/material.dart';

import 'helpers/colors.dart';
import 'helpers/iconManager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniServices',
    home: SplashPage(duration: 3, nextPage: MainPage()),
    );
  }
}
