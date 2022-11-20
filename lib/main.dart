import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_scbteamchallenge_admin/cubit/login_cubit.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/login_service.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/auth_page/auth_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/users_page/users_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginService loginService = LoginService();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit(LoginService());
    cubit.entering();
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
              child: MaterialApp(
                title: 'Monetochka',
                home: BlocBuilder<LoginCubit, LoginState>(
                  bloc: cubit,
                  builder: (context, state) {

                    if (state is AuthorizedState) {
                      return const UsersPage();
                    } else if (state is UnAuthorizedState) {
                      return const AuthPage();
                    } else {
                      return const AuthPage();
                    }
                  },
                ),
              ),
            ),
          );
        });
  }
}
