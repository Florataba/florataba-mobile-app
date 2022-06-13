import 'package:flutter/material.dart';

class BoxContent extends StatelessWidget {
  final Widget child;

  const BoxContent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.fromBorderSide(BorderSide(
            color: Colors.grey.shade400,
          )),
        ),
         child: child);
  }
}
