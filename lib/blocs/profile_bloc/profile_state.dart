import 'package:flutter/material.dart';

class ProfileState {
  final String avatarPath;
  final String userDescription;
  final String userMail;

  ProfileState({
    required String userMail,
    required String avatarPath,
    required String userDescription,
  })  : this.avatarPath = avatarPath,
        this.userDescription = userDescription,
        this.userMail = userMail;

  ProfileState copyWith({
    required String avatarPath,
    required String userDescription,
    required String userMail,
  }) {
    return ProfileState(
      avatarPath: avatarPath ?? this.avatarPath,
      userDescription: userDescription ?? this.userDescription,
      userMail: userMail ?? this.userMail,
    );
  }
}
