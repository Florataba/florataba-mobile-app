import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed("/registration"),
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: const Text("Forgot password?")),
          ),
        ],
      ),
    );
  }
}
