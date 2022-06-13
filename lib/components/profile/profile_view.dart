import 'package:flutter/material.dart';
import 'components/avatar_icon.dart';
import 'components/custom_btn.dart';
import 'components/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Florataba',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    userAvatar(context, "assets/avatars/avatar_1.jpg"),
                    const SizedBox(height: 20),
                    userInfo("aekrops", "aekrops@gmail.com", "+380969696231",
                        "Bronze (+10%)"),
                    const SizedBox(height: 35),
                    ProfileButtonWithBox("My Orders", () => {}, Colors.white, Colors.blueAccent),
                    const SizedBox(height: 25),
                    ProfileButton("Logout", () => {}, Colors.red)
                  ],
                ),
              )
            ],
          )),
    );
  }
}
