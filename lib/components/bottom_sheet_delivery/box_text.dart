import 'package:flutter/material.dart';

class BoxText extends StatelessWidget {
  final String title;
  final String subTitle;

  const BoxText({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(56, 56, 56, 1)),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  color: Color.fromRGBO(133, 141, 149, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
