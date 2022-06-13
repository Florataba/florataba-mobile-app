import 'package:florataba_mobile_app/components/catalog/components/selector_item.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatelessWidget {
  final List<String> selectorTitle;

  const CustomSelector({Key? key, required this.selectorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: selectorTitle
                  .map((value) => SelectorItem(title: value))
                  .toList())),
    );
  }
}
