import 'package:florataba_mobile_app/components/bottom_sheet_delivery/box_content.dart';
import 'package:florataba_mobile_app/components/bottom_sheet_delivery/box_text.dart';
import 'package:florataba_mobile_app/components/bottom_sheet_delivery/selector_component.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade500,
                ),
              )),
              child: Row(
                children: [
                  const Text(
                    'Please Choose',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Inter',
                      color: Color.fromRGBO(0, 105, 87, 1),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close_sharp,
                        size: 24,
                        color: Color.fromRGBO(133, 141, 149, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BoxContent(
                child: Column(
              children: [
                const BoxText(
                  title: 'Delivery Location',
                  subTitle:
                      'Select a delivery location to see product\navailability and delivery options',
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.add_circle_outline,
                        color: Color.fromRGBO(0, 105, 87, 1),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: const Text(
                          'Use current location',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Inter",
                            color:Color.fromRGBO(0, 105, 87, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            BoxContent(
                child: Column(
              children: [
                const BoxText(
                    title: 'Delivery Type',
                    subTitle:
                        'Select a delivery type to get flower in best\ncondition'),
                const SelectorComponents(
                  titleList: ['Nova Poshta', 'Ukrposhta', 'Courier'],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.add_circle_outline),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: const Text(
                                'Get delivered within 1day',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    color: Color.fromRGBO(133, 141, 149, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.add_circle_outline),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: const Text(
                                'Standar time waiting 3-4 days',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    color: Color.fromRGBO(133, 141, 149, 1)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            BoxContent(
                child: Column(
              children: const [
                BoxText(
                    title: 'Type of packaging',
                    subTitle: 'Select a type of packaging of your flowers '),
                SelectorComponents(
                  titleList: ['Standard', 'Eco', 'Minimalistic'],
                ),
              ],
            )),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentView()),
                )
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ],
        ),
      );
    },
  );
}
