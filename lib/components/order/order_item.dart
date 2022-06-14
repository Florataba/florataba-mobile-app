import 'package:florataba_mobile_app/api/orders/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyOrderItem extends StatelessWidget {
  final OrderModel data;

  const MyOrderItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.fromBorderSide(BorderSide(
          color: Color.fromRGBO(200, 200, 200, 1),
        )),
      ),
      width: MediaQuery.of(context).size.width,
      height: 136,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tracking ID: ${data.orderDetails}',
                style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      left: 2,
                      top: 8,
                      child: SvgPicture.asset(
                        'assets/avatars/order_icon.svg',
                        width: 65,
                        height: 65,
                      )),
                  Positioned(
                    top: 10,
                    left: 80,
                    child: Container(
                      width: 190,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        data.orderInfo,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left: 80,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        data.status,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color: Color.fromRGBO(188, 188, 188, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32,
                    right: 4,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "€${data.totalPrice}",
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Inter',
                            color: Color.fromRGBO(188, 188, 188, 1),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
