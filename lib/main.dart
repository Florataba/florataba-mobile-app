import 'package:florataba_mobile_app/api/user/user_api.dart';
import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/blocs/on_off_bloc/on_off_bloc.dart';
import 'package:florataba_mobile_app/components/catalog/catalog_view.dart';
import 'package:florataba_mobile_app/components/login/login_view.dart';
import 'package:florataba_mobile_app/components/login/registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    isLogged: (await UserApi().validateUser() == 200),
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) {
            LoginBloc _bloc = LoginBloc();
            _bloc.add(InitialLoginEvent(isLogged));
            return _bloc;
          }),
          BlocProvider(create: (BuildContext context) => OnOffBloc()),
        ],
        child: MyHomePage(
          isLogged: isLogged,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final bool isLogged;

  const MyHomePage({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: isLogged ? "/home" : "/login",
        routes: {
          '/login': (context) => const LoginView(),
          '/registration': (context) => const RegistrationView(),
          '/home': (context) => const CatalogView(),
        });
  }
}
