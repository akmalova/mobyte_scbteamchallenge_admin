import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/auth_page.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';
>>>>>>> 8b81a3555e2c420dc80fd988bbd79baad426f4d2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
      title: 'Monetochka',
      home: AuthPage(),
    );
=======
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
>>>>>>> 8b81a3555e2c420dc80fd988bbd79baad426f4d2
  }
}
