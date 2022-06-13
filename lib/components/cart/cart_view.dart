import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';
import 'package:florataba_mobile_app/components/cart/components/cart_button.dart';
import 'package:florataba_mobile_app/components/cart/components/cart_item.dart';
import 'package:florataba_mobile_app/components/cart/components/cart_item_divider.dart';
import 'package:florataba_mobile_app/components/cart/components/cart_total_info.dart';
import 'package:florataba_mobile_app/components/navigation/bottom_navigation.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Florataba', style: TextStyle(color: Colors.black)),
                ])),
        bottomNavigationBar: const BottomNavigation(),
        body: StoreConnector<CartState, List<BouquetModel>>(
          converter: (store) {
            return store.state.cartList.toSet().toList();
          },
          builder: (context, state) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: (state.length > 3) ? 370 : state.length * 125,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  CartItem(data: state[index]),
                              separatorBuilder: (context, index) =>
                                  const CartItemDivider(),
                              itemCount: state.length),
                        )),
                    Column(
                      children: const [
                        CartTotalInfo(),
                        CartButton(),
                      ],
                    )
                  ],
                ),
              ))),
        ));
  }
}
