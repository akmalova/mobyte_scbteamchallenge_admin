import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/clients_app_bar/clients_app_bar.dart';
import 'package:mobyte_scbteamchallenge_admin/presentation/widgets/table/users_table.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AppBarClients(numberClients: 367, listClients: []),
            UsersTable(
              data: [],
            ),
          ],
        ),
      ),
    );
  }
}
