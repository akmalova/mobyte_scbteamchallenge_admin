import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/cubit/login_cubit.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_strings.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/login_model.dart';

/// Страница авторизации администратора
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late String _login;
  late String _password;

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Обработка текстовых полей логин и пароль
  void _onLoginPressed() async {
    _login = loginController.text.trim();
    _password = passwordController.text.trim();
    await context.read<LoginCubit>().login(_login, _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.auth),
        centerTitle: true,
        backgroundColor: AppColors.darkBlue1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 700.w,
              height: 70.h,
              child: TextField(
                controller: loginController,
                decoration: InputDecoration(
                  labelText: AppStrings.login,
                  labelStyle: const TextStyle(color: AppColors.grey),
                  floatingLabelStyle: const TextStyle(color: AppColors.grey),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 700.w,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppStrings.password,
                  labelStyle: const TextStyle(color: AppColors.grey),
                  floatingLabelStyle: const TextStyle(color: AppColors.grey),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginError) {
                  return const Text(
                    'Неправильный логин или пароль',
                    style: TextStyle(fontSize: 17, color: AppColors.red),
                  );
                } else if (state is LoginInProgress) {
                  return const CircularProgressIndicator(color: AppColors.darkBlue1);
                } else {
                  return const Text('');
                }
              },
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: _onLoginPressed,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
                primary: AppColors.darkBlue1,
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 50.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: const Text(AppStrings.enter),
            ),
          ],
        ),
      ),
    );
  }
}
