import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/id_repository.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/login_service.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/authorisation_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/login_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/logout_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/role_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService loginService;

  LoginCubit(this.loginService) : super(LoginInitial());

  Future<void> login(String login, String password) async {
    LogInModel loginModel = LogInModel("error", UserModel(id: 0, name: "name", phone: "0", email: "email", registrationDate: "", updateDate: "", role: RoleModel(0, "", "")), AuthorisationModel( "", ""));
    try {
      loginModel = await loginService.logIn(login, password);
    } on DioError catch (e) {
      loginModel.status = "error";
      
    }
    if (loginModel.status == 'success') {
      IdRepository().save(loginModel.authorisation.token.toString());
      emit(LoginSuccess());
    } else if (loginModel.status == 'error') {
      emit(LoginError());
    } else {
      emit(LoginInProgress());
    }
  }

  void entering() {
    String? token = IdRepository().getId();
    if (token == null) {
      emit(UnAuthorizedState());
    } else {
      emit(AuthorizedState());
    }
  }

  Future<void> logout() async {
    LogOutModel logoutModel = await loginService.logOut();
    if (logoutModel.status == 'success') {
      IdRepository().invalidate();
      emit(LogoutSuccess());
    } else {
      emit(LogoutError());
    }
  }

  Future<List<UserModel>> usersList(
      String? string, int page, int perPage) async {
    emit(ListInProgress());
    List<UserModel> usersList =
        await loginService.usersList(string, page, perPage);
    emit(ListSuccess());
    return usersList;
  }
}
