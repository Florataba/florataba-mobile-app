part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class SuccessLogin extends LoginState {
  final String? userEmail;

  const SuccessLogin([this.userEmail]);
}

class SuccessUserRegistration extends LoginState {
  const SuccessUserRegistration();
}

class SuccessLogoutUser extends LoginState {
  const SuccessLogoutUser();
}

class ErrorLogin extends LoginState {
  const ErrorLogin();
}
