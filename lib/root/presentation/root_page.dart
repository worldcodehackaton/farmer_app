import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/cart/presentation/cart_page.dart';
import 'package:flutter_farmer_app/catalog/presentation/catalog_page.dart';
import 'package:flutter_farmer_app/home/presentation/home_page.dart';
import 'package:flutter_farmer_app/profile/presentation/profile_page.dart';
import 'package:flutter_farmer_app/ui/bottom_nav_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;

  late final PageController controller;

  final _pages = [
    const HomePage(),
    const CatalogPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  void _onChanged(int index) => setState(() {
        selectedIndex = index;
        controller.jumpToPage(index);
      });

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: PageView.builder(
          controller: controller,
          itemCount: _pages.length,
          onPageChanged: (page) => _onChanged(page),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, position) => _pages[selectedIndex],
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: selectedIndex,
          onChanged: (index) => _onChanged(index),
        ),
      );
}
