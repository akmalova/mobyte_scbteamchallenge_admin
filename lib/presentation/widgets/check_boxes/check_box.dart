import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';

class CheckBox extends StatefulWidget {
  final String text;
  bool value;
  final VoidCallback onTap;
  CheckBox({
    Key? key,
    required this.text,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.value = !widget.value;
          });
        },
        child: Row(
          children: [
            Container(
              height: 30.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                border: Border.all(color: AppColors.grey),
              ),
              child: (widget.value)
                  ? Icon(
                      Icons.check,
                      size: 20.r,
                    )
                  : SizedBox(width: 10.r),
            ),
            SizedBox(width: 2.w),
            Text(
              widget.text,
              style: AppTextStyles.appBarClientTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
