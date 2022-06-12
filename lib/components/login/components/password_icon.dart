import 'package:florataba_mobile_app/blocs/on_off_bloc/on_off_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordIcon extends StatelessWidget {
  final bool value;

  const PasswordIcon({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnOffBloc _bloc = BlocProvider.of<OnOffBloc>(context);
    return BlocBuilder<OnOffBloc, OnOffState>(
      bloc: _bloc,
      builder: (context, state) {
        return InkWell(
          onTap: () => context.read<OnOffBloc>().add(OnOffAction(value)),
          child: Icon(
            (value ? Icons.visibility_off_outlined : Icons.visibility_outlined),
            color: const Color.fromRGBO(171, 171, 171, 1),
          ),
        );
      },
    );
  }
}
