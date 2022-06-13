import 'package:florataba_mobile_app/api/user/user_api.dart';
import 'package:florataba_mobile_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/blocs/navigator_bloc/navigator_bloc.dart';
import 'package:florataba_mobile_app/blocs/on_off_bloc/on_off_bloc.dart';
import 'package:florataba_mobile_app/blocs/selector_bloc/selector_bloc.dart';
import 'package:florataba_mobile_app/components/cart/cart_view.dart';
import 'package:florataba_mobile_app/components/catalog/catalog_view.dart';
import 'package:florataba_mobile_app/components/login/login_view.dart';
import 'package:florataba_mobile_app/components/login/registration_view.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:florataba_mobile_app/redux/reducer/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

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
    return StoreProvider(
      store: Store<CartState>(reducer, initialState: CartState.init),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext context) {
              LoginBloc _bloc = LoginBloc();
              _bloc.add(InitialLoginEvent(isLogged));
              return _bloc;
            }),
            BlocProvider(create: (BuildContext context) => OnOffBloc()),
            BlocProvider(create: (BuildContext context) => SelectorBloc()),
            BlocProvider(create: (BuildContext context) {
              NavigatorBloc _bloc = NavigatorBloc();
              _bloc.add(const UpdateNavigation(0));
              return _bloc;
            }),
            BlocProvider(create: (BuildContext context) {
              CatalogBloc _bloc = CatalogBloc();
              _bloc.add(const LoadCatalog());
              return _bloc;
            }),
          ],
          child: MyHomePage(
            isLogged: isLogged,
          )),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isLogged;

  const MyHomePage({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLogged ? "/home" : "/login",
        routes: {
          '/login': (context) => const LoginView(),
          '/registration': (context) => const RegistrationView(),
          '/home': (context) => const CatalogView(),
          '/cart': (context) => const CartView(),
        });
  }
}
