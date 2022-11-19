import 'package:mobyte_scbteamchallenge_admin/utils/models/role_model.dart';

class UserModel {
  final int id;
  final String email;
  final String name;
  final String phone;
  final String registrationDate;
  bool isBlocked;
  final String updateDate;
  final RoleModel role;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.registrationDate,
    required this.updateDate,
    this.isBlocked = false,
    required this.role,
  });
}
