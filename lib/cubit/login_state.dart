part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginError extends LoginState {}

class LogoutSuccess extends LoginState {}

class LogoutError extends LoginState {}

class ListInProgress extends LoginState{}

class ListSuccess extends LoginState{}

class AuthorizedState extends LoginState{}
class UnAuthorizedState extends LoginState{}

