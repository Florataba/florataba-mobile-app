import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';


Widget userAvatar(BuildContext context, String avatar) {
  return Container(
    child: Column(
      children: [
        Avatar(
          sources: [GenericSource(AssetImage(avatar))],
        ),
        const SizedBox(height: 3),
      ],
    ),
  );
}
