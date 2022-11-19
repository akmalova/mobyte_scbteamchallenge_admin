import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Monetochka',
      home: AuthPage(),
    );
  }
}
