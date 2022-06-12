import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/components/login/components/custom_button.dart';
import 'package:florataba_mobile_app/components/login/components/custom_field.dart';
import 'package:florataba_mobile_app/components/login/components/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (listenerContext, state) {
        if (state is SuccessUserRegistration) {
          Navigator.of(context).popAndPushNamed("/login");
        }
        if (state is ErrorLogin) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Something went wrong"),
          ));
        }
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: const Padding(
              padding: EdgeInsets.all(8.0),
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
                        child: const TitleText(isLogin: false)),
                    const LoginField(
                        field: "Email", prefixIcon: Icons.email_outlined),
                    const LoginField(
                        field: "Password", prefixIcon: Icons.lock_outline),
                    const LoginField(
                        field: "First_name", prefixIcon: Icons.person_outline),
                    const LoginField(
                        field: "Surname", prefixIcon: Icons.person_outline),
                    const LoginField(
                        field: "Phone_number",
                        prefixIcon: Icons.phone_outlined),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: BlocBuilder<LoginBloc, LoginState>(
                            bloc: _bloc,
                            builder: (context, state) => CustomButton(
                                title: "Register",
                                onTap: () => context
                                    .read<LoginBloc>()
                                    .add(const CreateUserEvent())))),
                  ]),
            ),
          )),
    );
  }
}
