import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_strings.dart';

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
  void _onLoginPressed() {
    _login = loginController.text.trim();
    _password = passwordController.text.trim();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage()),
    );
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
              width: 330.w,
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
              width: 330.w,
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
            SizedBox(height: 30.h),
            ElevatedButton(
              onPressed: _onLoginPressed,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
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
