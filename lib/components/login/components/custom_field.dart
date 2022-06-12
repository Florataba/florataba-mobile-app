import 'package:florataba_mobile_app/blocs/login_bloc/login_bloc.dart';
import 'package:florataba_mobile_app/blocs/on_off_bloc/on_off_bloc.dart';
import 'package:florataba_mobile_app/components/login/components/password_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginField extends StatelessWidget {
  final String field;
  final IconData prefixIcon;

  const LoginField({Key? key, required this.field, required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc _bloc = BlocProvider.of<LoginBloc>(context);
    OnOffBloc _onOffBloc = BlocProvider.of<OnOffBloc>(context);
    var preparedText = field.replaceAll("_", " ");
    return BlocBuilder<LoginBloc, LoginState>(
      bloc: _bloc,
      builder: (context, state) => BlocBuilder<OnOffBloc, OnOffState>(
        bloc: _onOffBloc,
        builder: (context, onOffState) {
          return (onOffState is OnOffInitial)
              ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        preparedText,
                        style: const TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 18),
                      ),
                      TextField(
                        obscureText:
                            (field == "Password") ? (onOffState.state) : false,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          prefixIcon: Icon(prefixIcon,
                              color: const Color.fromRGBO(0, 8, 66, 1)),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Color.fromRGBO(0, 8, 66, 1)),
                          ),
                          labelText:
                              'Enter ${(field == "Email") ? "your email address" : "your ${preparedText.toLowerCase()}"}',
                          labelStyle: const TextStyle(
                              color: Color.fromRGBO(0, 8, 66, 1)),
                          suffixIcon: (field == "Password")
                              ? PasswordIcon(value: onOffState.state)
                              : null,
                        ),
                        onChanged: (value) => context.read<LoginBloc>().add(
                            HandleLoginInput(
                                inputName: field.toLowerCase(), input: value)),
                      ),
                    ],
                  ),
                )
              : Container();
        },
      ),
    );
  }
}
