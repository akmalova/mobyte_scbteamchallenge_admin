import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/login_service.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/login_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/logout_model.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginService loginService;

  LoginCubit(this.loginService) : super(LoginInitial());

  Future<void> login(String login, String password) async {
    LogInModel loginModel = await loginService.logIn(login, password);
    if (loginModel.status == 'success') {
      emit(LoginSuccess());
    } else if (loginModel.status == 'error') {
      emit(LoginError());
    } else {
      emit(LoginInProgress());
    }
  }

  Future<void> logout() async {
    LogOutModel logoutModel = await loginService.logOut();
    if (logoutModel.status == 'success') {
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
