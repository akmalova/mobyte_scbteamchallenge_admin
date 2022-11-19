import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/buttons/arrows_buttons.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';

class ItemCounter extends StatefulWidget {
  final VoidCallback onTapUp;
  final VoidCallback onTapDown;
  const ItemCounter({
    Key? key,
    required this.onTapUp,
    required this.onTapDown,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ItemCounterState();
}

class ItemCounterState extends State<ItemCounter> {
  int value = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
        horizontal: 4.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: AppColors.lightGrey),
        color: Colors.white,
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value.toString(),
              style: AppTextStyles.appBarClientTextStyle,
            ),
            SizedBox(width: 1.w),
            ArrowsButtons(
              onTapUp: () {
                setState(() {
                  value++;
                });
                widget.onTapUp();
              },
              onTapDown: () {
                setState(() {
                  if (value > 1) {
                    value--;
                  }
                });
                widget.onTapDown();
              },
            ),
          ],
        ),
      ),
    );
  }
}
