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
        padding: EdgeInsets.all( 16),
        margin: const EdgeInsets.only(top: 35.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Florataba',
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold,),
                  ),
                ),
                Spacer(),
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onTap: () => {Navigator.pop(context)},
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(height: 34),
                  userAvatar(context, "assets/avatars/avatar_1.jpg"),
                  const SizedBox(height: 20),
                  userInfo(
                      "aekrops", "aekrops", "+380969696231", "Bronze (+10%)"),
                  const SizedBox(height: 35),
                  ProfileButtonWithBox(
                      "My Orders", () => {}, Colors.white, Colors.grey),
                  const SizedBox(height: 25),
                  ProfileButton("Logout", () => {}, Colors.red)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
