import 'package:bloc/bloc.dart';
import 'package:florataba_mobile_app/api/user/user_api.dart';
import 'package:florataba_mobile_app/api/user/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _storage = const FlutterSecureStorage();
  final UserApi _api = UserApi();
  late UserModel? _userData;
  final Map<String, String> _input = {
    "email": "",
    "password": "",
    "first_name": "",
    "surname": "",
    "phone_number": "",
  };

  LoginBloc() : super(const LoginInitial()) {
    on<InitialLoginEvent>((event, emit) async {
      String? savedLogin = await _storage.read(key: "email");

      if (event.isLogged) {
        _userData = await _api.getUser(savedLogin!);

        emit(SuccessLogin(_userData?.email));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(const LoginInitial());
      try {
        _userData = await _api.getUser(_input["email"] as String);
        if (_userData == null) {
          emit(const ErrorLogin());
        } else if (_userData?.password == _input["password"]) {
          _storage.write(key: "email", value: _input["email"]);
          _storage.write(key: "password", value: _input["password"]);
          _storage.write(key: "isLogged", value: "true");
          emit(SuccessLogin(_userData?.email));
        } else {
          emit(const ErrorLogin());
        }
      } catch (error) {
        emit(const ErrorLogin());
      }
    });

    on<CreateUserEvent>((event, emit) async {
      try {
        await _api.createUser(_input);
        _storage.write(key: "password", value: _input["password"]);
        emit(const SuccessUserRegistration());
      } catch (error) {
        emit(const ErrorLogin());
      }

      emit(const LoginInitial());
    });

    on<HandleLoginInput>((event, emit) async {
      _input.update(event.inputName, (value) => event.input);
    });
    on<LogoutUserEvent>((event, emit) async {
      try {
        await _storage.deleteAll();
        emit(const SuccessLogoutUser());
      } catch (error) {
        emit(const ErrorLogin());
      }
    });
  }
}
