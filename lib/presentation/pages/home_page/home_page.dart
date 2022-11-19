import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/current_page.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/nav_menu.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

/// Основная страница приложения
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isOpen;
  Tabs _tabs = Tabs.analytics;

  @override
  void initState() {
    // В мобильном веб приложении меню по умолчанию скрыто
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      _isOpen = true;
    } else {
      _isOpen = true;
    }
    super.initState();
  }
  
  // Обработка нажатий на пункты меню
  void _pushMenu(Tabs tabs) {
    setState(() {
      _tabs = tabs;
    });
  }

  // Обработка нажатия на кнопку открыть/закрыть меню
  void _back() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _isOpen
              ? NavMenu(
                  tabs: _tabs,
                  onTap: _pushMenu,
                  onTapArrow: _back,
                )
              : Container(),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _isOpen
                          ? Container()
                          : IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: AppColors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isOpen = !_isOpen;
                                });
                              },
                            ),
                      IconButton(
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: AppColors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isOpen = !_isOpen;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CurrentPage(tabs: _tabs),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
