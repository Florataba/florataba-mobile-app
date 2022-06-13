import 'dart:math';

import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';
import 'package:florataba_mobile_app/redux/actions/cart_action.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CartItem extends StatelessWidget {
  final BouquetModel data;

  const CartItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.blue.shade100,
      Colors.red.shade100,
      Colors.yellow.shade100,
      Colors.purple.shade100,
      Colors.deepOrange.shade100
    ];
    Store<CartState> store = StoreProvider.of<CartState>(context);

    return StoreConnector<CartState, int>(
      converter: (store) => store.state.cartList
          .where((element) => element.title == data.title)
          .length,
      builder: (context, state) => Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          color: colorList[colorList.length -
                              1 -
                              Random().nextInt(colorList.length)],
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(20))),
                      width: 130,
                      height: 110,
                      child: Image.asset(data.imgUrl)),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              data.eventType,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () =>
                                      store.dispatch(RemoveFromCart(data)),
                                  child: const Icon(Icons.remove)),
                              Text("$state",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  )),
                              InkWell(
                                  onTap: () => store.dispatch(AddToCart(data)),
                                  child: const Icon(Icons.add)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "€${data.price}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )),
              ])),
    );
  }
}
