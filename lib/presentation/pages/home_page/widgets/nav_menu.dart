import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/auth_page.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/nav_menu_tile.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

/// Навигационное меню
class NavMenu extends StatefulWidget {
  final Tabs tabs;
  final void Function(Tabs) onTap;
  final VoidCallback onTapArrow;

  const NavMenu({
    Key? key,
    required this.tabs,
    required this.onTap,
    required this.onTapArrow,
  }) : super(key: key);

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  // Функция для выхода из аккаунта
  void _onTapExit() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
          builder: (BuildContext context) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: AppColors.darkBlue1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                  color: AppColors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Монеточка',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: _getTitleSize(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.onTapArrow();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                        ),
                      ),
                    ],
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: _onTapExit,
                child: Row(
                  children: const [
                    Text(
                      'Выйти',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.exit_to_app,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Функция для нахождения оптимального размера шрифта в зависмости
  // от ширины экрана
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
