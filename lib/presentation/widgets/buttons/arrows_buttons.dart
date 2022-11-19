import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';

class ArrowsButtons extends StatelessWidget {
  final VoidCallback onTapUp;
  final VoidCallback onTapDown;
  const ArrowsButtons({
    Key? key,
    required this.onTapUp,
    required this.onTapDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTapUp,
            child: Icon(
              Icons.arrow_drop_up_outlined,
              size: 25.r,
              color: AppColors.darkGrey,
            ),
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTapDown,
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 25.r,
              color: AppColors.darkGrey,
            ),
          ),
        ),
      ],
    );
  }
}
