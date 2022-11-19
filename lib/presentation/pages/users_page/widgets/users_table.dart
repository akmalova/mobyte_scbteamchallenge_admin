import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_colors.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/constants/app_strings.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

/// Таблица данных пользователей
class UsersTable extends StatefulWidget {
  final List<UserModel> data;

  const UsersTable({Key? key, required this.data}) : super(key: key);

  @override
  State<UsersTable> createState() => _UsersTableState();
}

class _UsersTableState extends State<UsersTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                AppStrings.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppStrings.phone,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppStrings.phone,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppStrings.registration,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkGrey,
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
                  color: AppColors.darkGrey,
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
    for (UserModel userModel in widget.data) {
      rows.add(
        DataRow(
          cells: <DataCell>[
            DataCell(Text(
              userModel.name,
              style: const TextStyle(
                color: AppColors.darkGrey,
              ),
            )),
            DataCell(Text(
              userModel.phone,
              style: const TextStyle(
                color: AppColors.darkGrey,
              ),
            )),
            DataCell(Text(
              userModel.email,
              style: const TextStyle(
                color: AppColors.darkGrey,
              ),
            )),
            DataCell(Text(
              userModel.registrationDate,
              style: const TextStyle(
                color: AppColors.darkGrey,
              ),
            )),
            DataCell(
              GestureDetector(
                onTap: () {
                  setState(() {
                    userModel.isBlocked = !userModel.isBlocked;
                  });
                },
                child: userModel.isBlocked
                    ? const Text(
                        AppStrings.lock,
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 13,
                        ),
                      )
                    : const Text(
                        AppStrings.unlock,
                        style: TextStyle(
                          color: AppColors.green,
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
