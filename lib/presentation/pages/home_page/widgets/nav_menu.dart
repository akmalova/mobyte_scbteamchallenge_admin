import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/nav_menu_tile.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/app_colors.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  bool _isAnalytics = false;
  bool _isUsers = false;
  bool _isEmployee = false;

  void _onTapAnalytics() {
    setState(() {
      _isAnalytics = !_isAnalytics;
      _isUsers = false;
      _isEmployee = false;
    });
  }

  void _onTapUsers() {
    setState(() {
      _isUsers = !_isUsers;
      _isAnalytics = false;
    });
  }

  void _onTapEmployee() {
    setState(() {
      _isEmployee = !_isEmployee;
      _isAnalytics = false;
      _isUsers = false;
    });
  }

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
              child: const Text(
                'Монеточка',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            NavMenuTile(
              label: 'Аналитика',
              icon: const Icon(Icons.analytics_outlined),
              onTap: _onTapAnalytics,
              isChoosed: _isAnalytics,
            ),
            NavMenuTile(
              label: 'Пользователи',
              icon: const Icon(Icons.people),
              onTap: _onTapUsers,
              isChoosed: _isUsers,
            ),
            NavMenuTile(
              label: 'Сотрудники',
              icon: const Icon(Icons.people_outline),
              onTap: _onTapEmployee,
              isChoosed: _isEmployee,
            ),
          ],
        ),
      ),
    );
  }
}
