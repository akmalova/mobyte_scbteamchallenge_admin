import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/cubit/login_cubit.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/clients_app_bar/clients_app_bar.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/users_page/widgets/users_table.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

/// Страница для отображения данных пользователей
class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  late List<UserModel> _usersList = [];

  void _getUsersList() async {
    _usersList = await context.read<LoginCubit>().usersList(null, 1, 15);
  }

  @override
  void initState() {
    _getUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
          if (state is ListSuccess) {
            return Column(
              children: [
                AppBarClients(
                    numberClients: _usersList.length, listClients: const []),
                UsersTable(
                  usersList: _usersList,
                ),
              ],
            );
          } else {
            return const Center(
              child:
                  CircularProgressIndicator(color: AppColors.darkBlue1),
            );
          }
        }),
      ),
    );
  }
}
