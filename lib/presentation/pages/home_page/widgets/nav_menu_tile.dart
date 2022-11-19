import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/tabs.dart';

/// Вкладка навигационного меню
class NavMenuTile extends StatefulWidget {
  final String label;
  final Widget icon;
  final void Function(Tabs) onTap;
  final Tabs tabs;
  final bool isChoosed;

  const NavMenuTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isChoosed,
    required this.tabs,
  }) : super(key: key);

  @override
  State<NavMenuTile> createState() => _NavMenuTileState();
}

class _NavMenuTileState extends State<NavMenuTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.isChoosed
            ? Container(
                color: AppColors.red,
                width: 5,
                height: 50,
              )
            : Container(),
        Expanded(
          child: Container(
            color: widget.isChoosed ? AppColors.darkBlue2 : Colors.transparent,
            height: 50,
            child: ListTile(
              horizontalTitleGap: 0,
              title: Text(
                widget.label,
                style: TextStyle(
                  color: widget.isChoosed ? AppColors.white : AppColors.grey,
                  fontSize: _getLabelsSize(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: widget.icon,
              iconColor: widget.isChoosed ? AppColors.white : AppColors.grey,
              onTap: () {
                widget.onTap(widget.tabs);
              },
            ),
          ),
        ),
      ],
    );
  }
  
  // Функция для нахождения оптимального размера шрифта в зависмости
  // от ширины экрана
  double _getLabelsSize() {
    double labelSize;
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 830) {
      labelSize = 14;
    } else if (screenWidth >= 760) {
      labelSize = 12;
    } else if (screenWidth >= 690) {
      labelSize = 10;
    } else if (screenWidth >= 620) {
      labelSize = 8;
    } else {
      labelSize = 0;
    }
    return labelSize;
  }
}
