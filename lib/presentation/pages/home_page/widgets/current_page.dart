import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_scbteamchallenge_admin/cubit/login_cubit.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/chat_page/chat_page.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/users_page/users_page.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

/// Класс, определяющий какую страницу необходимо отобразить
class CurrentPage extends StatelessWidget {
  final Tabs tabs;
  const CurrentPage({Key? key, required this.tabs}) : super(key: key);

  void _openUsers(BuildContext context) async {
    await context.read<LoginCubit>().usersList('a', 1, 15);
  }

  @override
  Widget build(BuildContext context) {
    switch (tabs) {
      case Tabs.analytics:
        return Container();
      case Tabs.chat:
        return const ChatPage();
      case Tabs.employee:
        return Container();
      case Tabs.users:
        _openUsers(context);
        return UsersPage();
      default:
        return Container();
    }
  }
}
