import 'package:florataba_mobile_app/components/navigation/navigation_item.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> navigationBarIcon = [
      Icons.home,
      Icons.notifications,
      Icons.shopping_cart,
      Icons.person
    ];
    List<String> navigationBarTitle = ["home", "news", "cart", "profile"];

    return Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navigationBarIcon
              .map((icon) => NavigationItem(
                  icon: icon,
                  index: navigationBarIcon.indexOf(icon),
                  title: navigationBarTitle[navigationBarIcon.indexOf(icon)]))
              .toList(),
        ));
  }
}
