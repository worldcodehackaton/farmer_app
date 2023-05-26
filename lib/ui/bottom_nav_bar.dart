import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  final int selectedIndex;

  final Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    double gap = 10;

    double iconSize = 26;

    const padding = EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 12,
    );

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
              blurRadius: 60,
              spreadRadius: -10,
              offset: const Offset(0, 25),
              color: Colors.black.withOpacity(.4),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
          child: GNav(
            tabs: [
              GButton(
                gap: gap,
                text: 'Главная',
                padding: padding,
                iconSize: iconSize,
                icon: LineIcons.home,
                iconColor: Colors.black,
                iconActiveColor: greenColor,
                backgroundColor: greenColor.withOpacity(.2),
              ),
              GButton(
                gap: gap,
                text: 'Каталог',
                padding: padding,
                iconSize: iconSize,
                icon: LineIcons.table,
                iconColor: Colors.black,
                iconActiveColor: greenColor,
                backgroundColor: greenColor.withOpacity(.2),
              ),
              GButton(
                gap: gap,
                iconSize: 24,
                text: 'Корзина',
                padding: padding,
                iconColor: Colors.black,
                icon: LineIcons.shoppingCart,
                iconActiveColor: greenColor,
                backgroundColor: greenColor.withOpacity(.2),
              ),
              GButton(
                gap: gap,
                text: 'Профиль',
                padding: padding,
                iconSize: iconSize,
                icon: LineIcons.user,
                iconColor: Colors.black,
                iconActiveColor: greenColor,
                backgroundColor: greenColor.withOpacity(.2),
              )
            ],
            onTabChange: onChanged,
            selectedIndex: selectedIndex,
          ),
        ),
      ),
    );
  }
}
