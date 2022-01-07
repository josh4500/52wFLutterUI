import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_shop/ui/cart/cart.dart';
import 'package:shoe_shop/ui/discover/discover.dart';
import 'package:shoe_shop/util/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SHOESHOP.SYSTEMOVERLAY.copyWith(
        systemNavigationBarColor:
            _selectedIndex == 0 ? const Color(0xFFE2E2E8) : null,
      ),
      child: Scaffold(
        extendBody: _selectedIndex == 0,
        extendBodyBehindAppBar: true,
        body: IndexedStack(
          index: _selectedIndex,
          sizing: StackFit.loose,
          children: [
            const Discover(),
            Container(),
            Container(),
            const Cart(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
            primaryColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFE3325B),
            unselectedItemColor: const Color(0xFF57585C),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Dsscover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline), label: "DIscover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.maps_home_work_rounded), label: "DIscover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "DIscover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: "DIscover"),
            ],
            currentIndex: _selectedIndex,
            elevation: 0.0,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
