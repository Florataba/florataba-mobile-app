import 'package:flutter/material.dart';

class ProfileButtonWithBox extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color textColor;
  final Color boxColor;

  const ProfileButtonWithBox(
      this.title, this.onTap, this.textColor, this.boxColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          // width of button
          width: MediaQuery.of(context).size.width / 1.15,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: boxColor,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            color: const Color.fromRGBO(12, 33, 193, 1),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color textColor;

  const ProfileButton(this.title, this.onTap, this.textColor, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20, color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
