
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftRightButtons extends StatelessWidget {
  const LeftRightButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:40.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_left),
          ),
          GestureDetector(
            child: const Icon(
              Icons.arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
