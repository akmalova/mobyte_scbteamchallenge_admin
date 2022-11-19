import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/clients_app_bar/clients_app_bar.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/users_page/widgets/users_table.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

/// Страница для отображения данных пользователей
class UsersPage extends StatelessWidget {
  final List<UserModel> _data = [];

  UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Column(
          children: [
            const AppBarClients(numberClients: 367, listClients: []),
            UsersTable(
              data: _data,
            ),
          ],
        ),
      ),
    );
  }
}
