import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_scbteamchallenge_admin/cubit/login_cubit.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/login_service.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/auth_page/auth_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginService loginService = LoginService();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return DefaultTextHeightBehavior(
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            child: BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(loginService),
              child: const MaterialApp(
                title: 'Monetochka',
                home: AuthPage(),
              ),
            ),
          );
        });
  }
}
