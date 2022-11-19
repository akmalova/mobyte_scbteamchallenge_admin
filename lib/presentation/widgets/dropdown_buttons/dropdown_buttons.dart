import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';

class DropDownSelector extends StatefulWidget {
  final List<String> items;
  final int? initialValue;
  final String hintText;
  final Function(int?) onSelected;

  const DropDownSelector({
    Key? key,
    required this.items,
    this.initialValue,
    required this.hintText,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<DropDownSelector> createState() => _DropDownSelectorState();
}

class _DropDownSelectorState extends State<DropDownSelector> {
  Iterable<DropdownMenuItem<int>> _mapItems() sync* {
    for (var i = 0; i < widget.items.length; i++) {
      yield DropdownMenuItem(
        value: i,
        child: Text(
          widget.items[i],
          style: AppTextStyles.appBarClientTextStyle,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<int>(
            isDense: true,
            hint: Flexible(
              child: Text(
                widget.hintText,
                style: AppTextStyles.appBarClientTextStyle.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ),
            value: widget.initialValue,
            items: _mapItems().toList(),
            onChanged: (int? index) {
              widget.onSelected(index);
            },
            buttonHeight: 35.h,
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(color: AppColors.lightGrey),
              color: Colors.white,
            ),
            iconEnabledColor: AppColors.darkGrey,
            buttonPadding: EdgeInsets.only(
              top: 4.h,
              bottom: 4.h,
              left: 5.w,
              right: 2.w,
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
            ),
            dropdownPadding: EdgeInsets.only(
              top: 6.h,
              bottom: 6.h,
            ),
            buttonOverlayColor: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return green, otherwise blue
              if (states.contains(MaterialState.pressed)) {
                return Colors.green;
              }
              return Colors.blue;
            }),
            itemHighlightColor: AppColors.pink, //!
            selectedItemHighlightColor: AppColors.pink,
            itemSplashColor: AppColors.pink,
          ),
        ),
      ],
    );
  }
}
