import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/provider/cart_provider.dart';
import 'package:shoe_shop/util/constant.dart';
import 'package:shoe_shop/widget/cart/cart_item_widget.dart';
import 'package:shoe_shop/widget/shared/custom_button.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, this.isInTab = true}) : super(key: key);

  final bool isInTab;

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SHOESHOP.SYSTEMOVERLAY.copyWith(
        systemNavigationBarColor: const Color(0xFFFEFEFE),
      ),
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          backgroundColor: const Color(0xFFFEFEFE),
          appBar: widget.isInTab
              ? null
              : AppBar(
                  backgroundColor: const Color(0xFFFEFEFE),
                  systemOverlayStyle: SHOESHOP.SYSTEMOVERLAY.copyWith(
                    systemNavigationBarColor: const Color(0xFFFEFEFE),
                    statusBarBrightness: Brightness.dark,
                  ),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.keyboard_backspace,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  elevation: 0,
                ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                      return Text(
                        'Total ${cartProvider.itemCount} items',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Expanded(
                child: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return const CartItemWidget();
                    },
                    itemCount: cartProvider.itemCount,
                  );
                }),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                      return Text(
                        '\$${cartProvider.totalAmount}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                  return CustomButton(
                      title: "Next",
                      disabled: cartProvider.itemCount == 0,
                      onTap: () {
                        Navigator.pushNamed(context, '/checkout');
                      });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
