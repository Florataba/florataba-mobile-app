import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/components/login/components/custom_button.dart';
import 'package:florataba_mobile_app/components/login/components/custom_field.dart';
import 'package:florataba_mobile_app/components/login/components/forgot_password.dart';
import 'package:florataba_mobile_app/components/login/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (listenerContext, state) {
        if (state is SuccessLogin) {
          Navigator.of(context).popAndPushNamed("/home");
        }
        if (state is ErrorLogin) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Incorrect email or password"),
          ));
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Florataba',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: const TitleText(isLogin: true)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        const LoginField(
                            field: "Email", prefixIcon: Icons.email_outlined),
                        const LoginField(
                            field: "Password", prefixIcon: Icons.lock_outline),
                        const ForgotPassword(),
                        Align(
                          alignment: Alignment.center,
                          child: BlocBuilder<LoginBloc, LoginState>(
                              bloc: _bloc,
                              builder: (context, state) => CustomButton(
                                  title: "Login",
                                  onTap: () => context
                                      .read<LoginBloc>()
                                      .add(const LoginUserEvent()))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
