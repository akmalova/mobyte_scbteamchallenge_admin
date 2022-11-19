import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const DefaultTextHeightBehavior(
            textHeightBehavior: TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            child: MaterialApp(
              title: 'Monetochka',
              home: HomePage(),
            ),
          );
        });
  }
}
