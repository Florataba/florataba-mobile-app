import 'package:florataba_mobile_app/api/catalog/catalog_model.dart';
import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    required this.data,
  }) : super(key: key);

  final int index;
  final double? extent;
  final Color? backgroundColor;
  final BouquetModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: extent,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.blue.shade100,
            borderRadius: BorderRadius.circular(28)),
        child: Stack(children: [
          Expanded(
            child: Center(
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Image.asset(data.imgUrl)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        data.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ))),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20)),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('€${data.price}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)))),
            ],
          )
        ]));
  }
}
