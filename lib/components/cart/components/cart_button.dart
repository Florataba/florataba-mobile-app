import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => onTap(),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(28),
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
    );
  }
}
