import 'package:florataba_mobile_app/components/profile/components/styled_text.dart';
import 'package:flutter/material.dart';

Widget userInfo(String username, String email, String phone, String status) {
  return Column(
    children: [
      editableInfoField("username", username, true),
      const SizedBox(height: 10),
      editableInfoField("email", email, true),
      const SizedBox(height: 10),
      editableInfoField("phone", phone, true),
      const SizedBox(height: 10),
      editableInfoField("status", status, false),
    ],
  );
}

Widget editableInfoField(String label, String value, bool enabled) {
  return Container(
    child: Column(
      children: [
        StyledText(label, 16.0, FontWeight.w500, Colors.black45),
        const SizedBox(height: 5),
        Center(
          child: Row(
            children: [
              const Spacer(),
              Container(
                width: 280,
                child: TextFormField(
                  enabled: enabled,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                    onPressed: () => {},
                    icon: const Icon(Icons.edit, size: 24),
                  )),
                  initialValue: value,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    ),
  );
}
