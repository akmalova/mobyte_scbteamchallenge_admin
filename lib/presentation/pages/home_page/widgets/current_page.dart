import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/chat_page/chat_page.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

/// Класс, определяющий какую страницу необходимо отобразить
class CurrentPage extends StatelessWidget {
  final Tabs tabs;
  const CurrentPage({Key? key, required this.tabs}) : super(key: key);

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
        return Container();
      default:
        return Container();
    }
  }
}
