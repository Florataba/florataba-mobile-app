import 'package:florataba_mobile_app/blocs/order_bloc/order_bloc.dart';
import 'package:florataba_mobile_app/components/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_item.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderBloc _orderBloc = BlocProvider.of<OrderBloc>(context);
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
            Text('Florataba', style: TextStyle(color: Colors.black)),
          ])),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocBuilder<OrderBloc, OrderState>(
            bloc: _orderBloc,
            builder: (context, state) {
              return (state is LoadedOrders)
                  ? Column(
                      children: state.list
                          .map((value) => MyOrderItem(data: value))
                          .toList())
                  : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
