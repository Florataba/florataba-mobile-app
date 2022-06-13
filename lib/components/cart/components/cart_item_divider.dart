import 'package:flutter/material.dart';

class CartItemDivider extends StatelessWidget {
  const CartItemDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int dotCount = (MediaQuery.of(context).size.width - 54) ~/ 9;
    return Row(
      children: List.generate(
          dotCount,
          (index) => Expanded(
                child: Container(
                  color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                  height: 2,
                ),
              )),
    );
  }
}
