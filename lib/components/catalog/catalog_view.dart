import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is SuccessLogoutUser) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/login", (route) => false);
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black.withOpacity(0.8),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Florataba'),
                  InkWell(
                      onTap: () => _loginBloc.add(const LogoutUserEvent()),
                      child: const Icon(Icons.logout))
                ],
              ),
            ),
            body: BlocBuilder<LoginBloc, LoginState>(
              bloc: _loginBloc,
              builder: (context, state) {

                return Container(
                  child: Text((state is SuccessLogin)
                      ? state.userEmail as String
                      : "ERROR"),
                );
              },
            )));
  }
}
