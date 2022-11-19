import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/home_page.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';

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
        title: const Text('Авторизация'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(44, 60, 86, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: loginController,
                decoration: InputDecoration(
                  labelText: 'Логин',
                  labelStyle: const TextStyle(color: AppColors.grey),
                  floatingLabelStyle: const TextStyle(color: AppColors.grey),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: const TextStyle(color: AppColors.grey),
                  floatingLabelStyle: const TextStyle(color: AppColors.grey),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onLoginPressed,
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                primary: AppColors.darkBlue1,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
