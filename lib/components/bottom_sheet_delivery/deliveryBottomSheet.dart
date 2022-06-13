import 'package:florataba_mobile_app/components/payment/payment_view.dart';
import 'package:flutter/material.dart';

void deliveryBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  Text(
                    'Please Choose',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(0, 105, 87, 1),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.close_sharp,
                    size: 24,
                    color: Color.fromRGBO(133, 141, 149, 1),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color.fromRGBO(238, 242, 245, 1),
            ),
            const SizedBox(height: 8),
            Container(
              height: 108,
              width: 360,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromRGBO(242, 243, 243, 1),
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Delivery Location',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(56, 56, 56, 1)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select a delivery location to see product\navailability and delivery options',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Inter",
                          color: Color.fromRGBO(133, 141, 149, 1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.my_location,
                          color: Color.fromRGBO(0, 105, 87, 1),
                          size: 12,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () => {},
                          child: const Text(
                            'Use current Location',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(0, 105, 87, 1)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 360,
              height: 184,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromRGBO(242, 243, 243, 1),
                )),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Delivery Type',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Inter",
                          color: Color.fromRGBO(56, 56, 56, 1)),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Select a delivery type to get flower in best\ncondition',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Inter",
                        color: Color.fromRGBO(133, 141, 149, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(BorderSide(
                        color: Color.fromRGBO(242, 243, 243, 1),
                      )),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => {},
                          child: const Text(
                            'Nova Poshta',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: Color.fromRGBO(133, 141, 149, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          color: const Color.fromRGBO(242, 243, 243, 1),
                        ),
                        InkWell(
                          onTap: () => {},
                          child: const Text('Ukrposhta',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(133, 141, 149, 1),
                              )),
                        ),
                        Container(
                            width: 1,
                            color: const Color.fromRGBO(242, 243, 243, 1)),
                        InkWell(
                          onTap: () => {},
                          child: const Text('Courier',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(133, 141, 149, 1),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      SizedBox(width: 8),
                      //тут має бути чекбокс))
                      Icon(Icons.add_circle_outline),
                      SizedBox(width: 8),
                      Text(
                        'Get delivered within 1day',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(133, 141, 149, 1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 1,
                    color: const Color.fromRGBO(242, 243, 243, 1),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 16,
                    child: Row(
                      children: const [
                        SizedBox(width: 8),
                        //тут має бути чекбокс))
                        Icon(Icons.add_circle_outline),
                        SizedBox(width: 8),
                        Text(
                          'I am not dieing',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: Color.fromRGBO(133, 141, 149, 1)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 360,
              height: 104,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(BorderSide(
                  color: Color.fromRGBO(242, 243, 243, 1),
                )),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Type of packaging',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            color: Color.fromRGBO(56, 56, 56, 1)),
                      ),
                    ),
                    SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select a type of packaging of your flowers ',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Inter",
                          color: Color.fromRGBO(133, 141, 149, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => {},
                          child: const Text(
                            'Vlad',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Inter",
                              color: Color.fromRGBO(133, 141, 149, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          color: const Color.fromRGBO(242, 243, 243, 1),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentView()),
                            );
                          },
                          child: const Text('Markotus',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(133, 141, 149, 1),
                              )),
                        ),
                        Container(
                            width: 1,
                            color: const Color.fromRGBO(242, 243, 243, 1)),
                        InkWell(
                          onTap: () => {},
                          child: const Text('Dotem',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: Color.fromRGBO(133, 141, 149, 1),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentView()),
                  )
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      );
    },
  );
}