import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/counters/items_counter.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/search_bar/search_bar.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';

class AppBarClients extends StatelessWidget {
  final int numberClients;
  final List<String> listClients;
  const AppBarClients({
    Key? key,
    required this.numberClients,
    required this.listClients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemCounter(
          onTapUp: () {},
          onTapDown: () {},
        ),
        SizedBox(width: 10.w),
        Text(
          "Всего: $numberClients",
          style: AppTextStyles.appBarClientTextStyle,
        ),
        const Spacer(),
        const SearchBar(),
      ],
    );
  }
}
