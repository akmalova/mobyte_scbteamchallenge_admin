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
  bool _isDirectors = false;

  void _onTapAnalytics() {
    setState(() {
      _isAnalytics = !_isAnalytics;
      _isDirectors = false;
    });
  }

  void _onTapDirectors() {
    setState(() {
      _isDirectors = !_isDirectors;
      _isAnalytics = false;
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
                'Название?',
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
              onTap: _onTapDirectors,
              isChoosed: _isDirectors,
            ),
            NavMenuTile(
              label: 'Директора',
              icon: const Icon(Icons.people),
              onTap: _onTapAnalytics,
              isChoosed: _isAnalytics,
            ),
          ],
        ),
      ),
    );
  }
}
