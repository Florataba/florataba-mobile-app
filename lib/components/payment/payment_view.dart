import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.8),
          automaticallyImplyLeading: false,
          title: const Text('Payment'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Select a Payment Method',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 19,
                        color: Colors.black)),
              ),
              const SizedBox(height: 8),
              Container(
                height: 400,
                width: 360,
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
                              child: const Text(
                                " Pay",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 148,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total ' + '1200',
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Inter', color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '6 ' + 'items',
                  style: TextStyle(
                      fontSize: 14, fontFamily: 'Inter', color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 48,
                width: 340,
                child: InkWell(
                  onTap: () => {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Complete Order",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
