import 'package:flutter/material.dart';

class SelectorComponents extends StatelessWidget {
  final List<String> titleList;

  const SelectorComponents({Key? key, required this.titleList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: const BoxDecoration(
          border:
              Border.fromBorderSide(BorderSide(width: 0.5, color: Colors.grey)),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: titleList.map((value) => _selectorItem(value)).toList()));
  }

  Widget _selectorItem(String value) {
    return Expanded(
      child: InkWell(
        onTap: () => {},
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
            width: 0.5,
          )),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: "Inter",
                color: Color.fromRGBO(133, 141, 149, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
