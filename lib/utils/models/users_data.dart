abstract class UsersData {
  late String name;
  late String phone;
  late String email;
  late String registrationDate;
}

class UserData implements UsersData {
  @override
  String email;

  @override
  String name;

  @override
  String phone;

  @override
  String registrationDate;

  bool isBlocked;

  UserData({
    required this.name,
    required this.phone,
    required this.email,
    required this.registrationDate,
    required this.isBlocked,
  });
}
