import 'package:collection/collection.dart';
import 'package:florataba_mobile_app/blocs/order_bloc/order_bloc.dart';
import 'package:florataba_mobile_app/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderBloc _orderBloc = BlocProvider.of<OrderBloc>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            Text('Florataba', style: TextStyle(color: Colors.black)),
          ])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Select a Payment Method',
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 19, color: Colors.black)),
            ),
            const SizedBox(height: 8),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromRGBO(200, 200, 200, 1),
                )),
              ),
              child: Stack(
                children: [
                  const Positioned(
                      left: 16,
                      top: 12,
                      child: Text(
                        'Card',
                        style: TextStyle(fontSize: 17),
                      )),
                  Positioned(
                    left: 16,
                    top: 36,
                    child: SizedBox(
                      height: 48,
                      width: 328,
                      child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.payment),
                            labelText: '4012 **** **** 1881',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(200, 200, 200, 1),
                                    width: 32.0),
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onChanged: (value) => {}),
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    top: 100,
                    child: Text(
                      'Expiration Date',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 161, 1)),
                    ),
                  ),
                  const Positioned(
                    right: 124,
                    top: 100,
                    child: Text(
                      'CVV',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 161, 1)),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 124,
                    child: SizedBox(
                      height: 48,
                      width: 164,
                      child: TextField(
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.calendar_today_outlined),
                            labelText: '19/28',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(200, 200, 200, 1),
                                    width: 32.0),
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onChanged: (value) => {}),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 124,
                    child: SizedBox(
                      height: 48,
                      width: 140,
                      child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.payment_sharp),
                            labelText: '***',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(200, 200, 200, 1),
                                    width: 32.0),
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onChanged: (value) => {}),
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    top: 188,
                    child: Text(
                      'Card Holder’s Name',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 161, 1)),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 212,
                    child: SizedBox(
                      height: 48,
                      width: 228,
                      child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            labelText: 'Dr.Watson',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(200, 200, 200, 1),
                                    width: 32.0),
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onChanged: (value) => {}),
                    ),
                  ),
                  const Positioned(
                    left: 16,
                    bottom: 104,
                    child: Text(
                      'Complete order by: ApplePay ',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color.fromRGBO(153, 153, 161, 1)),
                    ),
                  ),
                  Positioned(
                      left: 14,
                      bottom: 48,
                      child: InkWell(
                        onTap: () => {},
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 28, vertical: 12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.apple,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Pay",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            )),
                      ))
                ],
              ),
            ),
            StoreConnector<CartState, List>(
              converter: (store) {
                var totalSum = store.state.cartList
                        .map((data) => data.price)
                        .toList()
                        .sum *
                    0.95;
                var totalItemCount = store.state.cartList.length;

                return [totalSum, totalItemCount];
              },
              builder: (context, state) => Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Total €${state[0].toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Text(
                          '${state[1]} items',
                          style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () {
                          print("dfs");
                          _orderBloc.add(AddOrder({
                            'street': "Shafaryka",
                            'region': "Lviv",
                            'build_number': "199",
                            'apartment_number': "161",
                            'total_price': state[0].toStringAsFixed(2),
                            'order_info': "Exclusive ${state[1]} item",
                            'status': "Collecting"
                          }));
                          _orderBloc.add(LoadOrders());
                          Navigator.of(context).pushNamed("/order-list");
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Complete order",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
