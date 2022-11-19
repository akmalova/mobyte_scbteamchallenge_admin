import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/search_bar/search_bar.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_strings.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

class AppBarClients extends StatelessWidget {
  final int numberClients;
  final List<UserModel> listClients;
  const AppBarClients({
    Key? key,
    required this.numberClients,
    required this.listClients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${AppStrings.total}: $numberClients",
          style: AppTextStyles.appBarClientTextStyle,
        ),
        const Spacer(),
        const SearchBar(),
      ],
    );
  }
}
