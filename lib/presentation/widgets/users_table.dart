import 'package:flutter/material.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/users_data.dart';

/// Таблица данных пользователей
class UsersTable extends StatefulWidget {
  final List<UserData> data;

  const UsersTable({Key? key, required this.data}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'ФИО',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Телефон',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Почта',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Регистрация',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(97, 97, 97, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
        rows: _buildRows(),
      ),
    );
  }

  List<DataRow> _buildRows() {
    List<DataRow> rows = [];
    for (UserData userData in widget.data) {
      rows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              userData.name,
              style: const TextStyle(
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            )),
            DataCell(Text(
              userData.phone,
              style: const TextStyle(
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            )),
            DataCell(Text(
              userData.email,
              style: const TextStyle(
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            )),
            DataCell(Text(
              userData.registrationDate,
              style: const TextStyle(
                color: Color.fromRGBO(97, 97, 97, 1),
              ),
            )),
            DataCell(
              GestureDetector(
                onTap: () {
                  setState(() {
                    userData.isBlocked = !userData.isBlocked;
                  });
                },
                child: userData.isBlocked
                    ? const Text(
                        'Заблокировать',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                        ),
                      )
                    : const Text(
                        'Разблокировать',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}
