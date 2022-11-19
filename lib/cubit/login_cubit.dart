import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobyte_scbteamchallenge_admin/domain/data_source/login_service.dart';
import 'package:mobyte_scbteamchallenge_admin/utils/models/login_model.dart';

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
}
