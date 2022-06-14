import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'order_item.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({Key? key}) : super(key: key);

  final List _trackingId = [
    'Tracking ID: 263512074109',
    'Tracking ID: 263512074432',
    'Tracking ID: 263512045678',
    'Tracking ID: 263512876543',
  ];

  final List _sizes = [
    'Size: Medium 22”H x 13”W',
    'Size: Medium 22”H x 13”W',
    'Size: Medium 22”H x 13”W',
    'Size: Medium 22”H x 13”W',
  ];

  final List _titlesOrder = [
    'French Marigold',
    'Ukraine Marigold',
    'Poland Marigold',
    'German Marigold',
  ];

  final List _prices = [
    '₹494.00',
    '₹700.00',
    '₹228.00',
    '₹69.00',
  ];

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: _trackingId.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 8),
                          MyOrderItem(_trackingId[index], _titlesOrder[index],
                              _sizes[index], _prices[index]),
                          const SizedBox(height: 8),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

