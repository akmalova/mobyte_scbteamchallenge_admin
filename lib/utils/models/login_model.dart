import 'package:mobyte_scbteamchallenge_admin/utils/models/authorisation_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

class LogInModel {
  String status;
  final UserModel user;
  final AuthorisationModel authorisation;

  LogInModel(this.status, this.user, this.authorisation);
}