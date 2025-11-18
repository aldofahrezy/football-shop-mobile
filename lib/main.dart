import 'package:flutter/material.dart';
import 'package:football_shop/screens/login.dart';
import 'package:football_shop/themes/app_theme.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'The Kickoff Zone',
        theme: appTheme,
        home: const LoginPage(),
      ),
    );
  }
}
