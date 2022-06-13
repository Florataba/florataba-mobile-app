import 'package:collection/collection.dart';
import 'package:florataba_mobile_app/components/cart/components/cart_item_divider.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartTotalInfo extends StatelessWidget {
  const CartTotalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: StoreConnector<CartState, double>(
            converter: (store) =>
                store.state.cartList.map((data) => data.price).toList().sum,
            builder: (context, state) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Subtotal:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "€${state.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          )
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Discount:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "5%",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: const CartItemDivider()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Price:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "€${(state * 0.95).toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ]),
                  ],
                )));
  }
}
