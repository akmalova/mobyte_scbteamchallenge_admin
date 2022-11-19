import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/app_colors.dart';

class NavMenuTile extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;
  final bool isChoosed;

  const NavMenuTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isChoosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isChoosed
            ? Container(
                color: AppColors.red,
                width: 5,
                height: 50,
              )
            : Container(),
        Expanded(
          child: Container(
            color: isChoosed ? AppColors.darkBlue2 : Colors.transparent,
            height: 50,
            child: ListTile(
              title: Text(
                label,
                style: TextStyle(
                  color: isChoosed ? AppColors.white : AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: icon,
              iconColor: isChoosed ? AppColors.white : AppColors.grey,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
