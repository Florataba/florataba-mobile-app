import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final bool isLogin;

  const TitleText({Key? key, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isLogin ? "Sign in" : "Sign up",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLogin
                          ? "If you don’t have an account register"
                          : "If you already have an account register",
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('You can ',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(isLogin ? "/registration" : "/"),
                          child: Text(
                              isLogin ? "Register here!" : "Login here!",
                              style: const TextStyle(
                                  color: Color.fromRGBO(12, 33, 193, 1),
                                  fontSize: 20)),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
