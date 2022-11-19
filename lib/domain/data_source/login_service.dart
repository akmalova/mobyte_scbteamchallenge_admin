import 'package:dio/dio.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/login_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/authorisation_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/logout_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/role_model.dart';
import 'dart:convert';

import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

class LoginService {
  final Dio dio = Dio();
  final String url = 'https://mobytescbteamchallenge.herokuapp.com';
  late String token;

  Future<LogInModel> logIn(String login, String password) async {
    Response response = await dio.post(
      url + '/api/auth/login',
      queryParameters: {"email": login, "password": password},
      options: Options(method: 'POST'),
    );
    var map = jsonDecode(response.toString());
    String status = map['status'];
    var user = map['user'];
    var role = user['role'];
    RoleModel roleModel = RoleModel(role['id'], role['title'], role['const']);
    UserModel userModel = UserModel(
      id: user['id'],
      name: user['name'],
      phone: user['phone'],
      email: user['email'],
      registrationDate: user['created_at'],
      updateDate: user['updated_at'],
      role: roleModel,
    );
    var auth = map['authorisation'];
    token = auth['token'];
    AuthorisationModel authorisationModel =
        AuthorisationModel(auth['token'], auth['type']);
    return LogInModel(status, userModel, authorisationModel);
  }

  Future<LogOutModel> logOut() async {
    Response response = await dio.post(
      url + '/api/auth/logout',
      options: Options(
        method: 'POST',
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    var map = jsonDecode(response.toString());
    return LogOutModel(map['status'], map['message']);
  }

  Future<List<UserModel>> usersList(
      String? string, int? page, int? perPage) async {
    Response response = await dio.get(
      url + '/api/user',
      queryParameters: {"search": string, "page": page, "per_page": perPage},
      options: Options(
        method: 'GET',
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    var map = jsonDecode(response.toString());
    print(map);
    var users = map['data'];
    List<UserModel> usersList = [];
    for (var user in users) {
      var role = user['role'];
      user = UserModel(
        id: user['id'],
        name: user['name'],
        phone: user['phone'],
        email: user['email'],
        registrationDate: user['created_at'],
        updateDate: user['updated_at'],
        role: RoleModel(
          role['id'],
          role['title'],
          role['constt'],
        ),
      );
      usersList.add(user);
    }
    return usersList;
  }
}
