import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/pages/users_page/widgets/search_field.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_strings.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_textstyles.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

class AppBarClients extends StatelessWidget {
  final int numberClients;
  final List<UserModel> listClients;
  final TextEditingController textEditingController;
  final VoidCallback onTap;

  const AppBarClients({
    Key? key,
    required this.numberClients,
    required this.listClients,
    required this.textEditingController,
    required this.onTap,
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
        SearchField(
            controller: textEditingController, onTap: onTap, label: 'Найти...')
      ],
    );
  }
}
