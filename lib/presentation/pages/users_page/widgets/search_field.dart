import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';

class SearchField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final TextEditingController controller;

  const SearchField({
    Key? key,
    required this.controller,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 300.w,
      color: AppColors.tranparent,
      child: TextField(
        style: const TextStyle(
          color: AppColors.darkGrey,
          fontSize: 14,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: AppColors.white,
          labelText: label,
          labelStyle: const TextStyle(color: AppColors.darkGrey),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: const Icon(Icons.done),
          ),
        ),
      ),
    );
  }
}
