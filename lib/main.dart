import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Monetochka',
      home: HomePage(),
    );
  }
}
