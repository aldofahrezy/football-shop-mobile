import 'package:flutter/material.dart';
import 'package:football_shop/themes/app_theme.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Kickoff Zone',
      theme: appTheme,
      home: MyHomePage(),
    );
  }
}
