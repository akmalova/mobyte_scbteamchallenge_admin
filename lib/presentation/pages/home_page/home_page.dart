import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/home_page/widgets/nav_menu.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _isOpen;

  @override
  void initState() {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android) {
      _isOpen = true;
    } else {
      _isOpen = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _isOpen ? const NavMenu() : Container(),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
