import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/nav_menu_tile.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

class NavMenu extends StatefulWidget {
  final Tabs tabs;
  final void Function(Tabs) onTap;

  const NavMenu({
    Key? key,
    required this.tabs,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  // bool _isAnalytics = false;
  // bool _isUsers = false;
  // bool _isEmployee = false;
  // bool _isChat = false;

  // void _onTapAnalytics() {
  //   setState(() {
  //     _isAnalytics = true;
  //     _isUsers = false;
  //     _isEmployee = false;
  //     _isChat = false;
  //   });
  // }

  // void _onTapUsers() {
  //   setState(() {
  //     _isUsers = true;
  //     _isAnalytics = false;
  //     _isEmployee = false;
  //     _isChat = false;
  //   });
  // }

  // void _onTapEmployee() {
  //   setState(() {
  //     _isEmployee = true;
  //     _isAnalytics = false;
  //     _isUsers = false;
  //     _isChat = false;
  //   });
  // }

  // void _onTapChat() {
  //   setState(() {
  //     _isChat = true;
  //     _isEmployee = false;
  //     _isAnalytics = false;
  //     _isUsers = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppColors.darkBlue1,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 25),
              color: AppColors.red,
              child: Text(
                'Монеточка',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: _getTitleSize(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NavMenuTile(
              label: 'Аналитика',
              icon: const Icon(Icons.analytics_outlined),
              onTap: widget.onTap,
              tabs: Tabs.analytics,
              isChoosed: widget.tabs == Tabs.analytics,
            ),
            NavMenuTile(
              label: 'Пользователи',
              icon: const Icon(Icons.people),
              onTap: widget.onTap,
              tabs: Tabs.users,
              isChoosed: widget.tabs == Tabs.users,
            ),
            NavMenuTile(
              label: 'Сотрудники',
              icon: const Icon(Icons.people_outline),
              onTap: widget.onTap,
              tabs: Tabs.employee,
              isChoosed: widget.tabs == Tabs.employee,
            ),
            NavMenuTile(
              label: 'Чат',
              icon: const Icon(Icons.chat),
              onTap: widget.onTap,
              tabs: Tabs.chat,
              isChoosed: widget.tabs == Tabs.chat,
            ),
          ],
        ),
      ),
    );
  }

  double _getTitleSize() {
    double titleSize;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 550) {
      titleSize = 20;
    } else if (screenWidth >= 495) {
      titleSize = 18;
    } else if (screenWidth >= 440) {
      titleSize = 16;
    } else if (screenWidth >= 385) {
      titleSize = 14;
    } else if (screenWidth >= 335) {
      titleSize = 12;
    } else {
      titleSize = 10;
    }
    return titleSize;
  }
}
