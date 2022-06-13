import 'package:florataba_mobile_app/components/profile/components/styled_text.dart';
import 'package:flutter/material.dart';

Widget userInfo(String username, String email, String phone, String status) {
  return Column(
    children: [
      editableInfoField("username", username),
      const SizedBox(height: 10),
      editableInfoField("email", email),
      const SizedBox(height: 10),
      editableInfoField("phone", phone),
      const SizedBox(height: 10),
      nonEditableInfoField("status", status),
    ],
  );
}

Widget nonEditableInfoField(String label, String value) {
  return Column(
    children: [
      StyledText(label, 16.0, FontWeight.w500, Colors.black45),
      const SizedBox(height: 5),
      StyledText(value, 20.0, FontWeight.w500, Colors.black),
    ],
  );
}

Widget editableInfoField(String label, String value) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      StyledText(label, 16.0, FontWeight.w500, Colors.black45),
      const SizedBox(height: 5),
      Container(
        // can kill some phones cause of resolution
        margin: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StyledText(value, 20.0, FontWeight.w500, Colors.black),
            const SizedBox(width: 15),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.edit))
          ],
        ),
      ),
    ],
  );
}
