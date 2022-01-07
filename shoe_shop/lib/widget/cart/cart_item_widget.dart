import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/model/cart_item.dart';
import 'package:shoe_shop/provider/cart_provider.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget(
      {Key? key, required this.index, required this.itemProduct})
      : super(key: key);
  final int index;
  final CartItem itemProduct;

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 120,
                  margin: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFCBD1D8),
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Transform.rotate(
                    angle: -0.42,
                    alignment: Alignment.topLeft,
                    child: Image.asset("assets/images/nike.png"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CartProvider>(builder: (context, cartItems, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItems.items[widget.index].title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "\$${cartItems.items[widget.index].price * cartItems.items[widget.index].quantity}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFCBD1D8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.remove),
                              onPressed: () => Provider.of<CartProvider>(
                                      context,
                                      listen: false)
                                  .removeItem(widget.index),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Consumer<CartProvider>(
                                builder: (context, cartItem, _) {
                              return Text(
                                  '${cartItem.items[widget.index].quantity}');
                            }),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFCBD1D8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: IconButton(
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.add),
                              onPressed: () => Provider.of<CartProvider>(
                                      context,
                                      listen: false)
                                  .addItem(cartItem: widget.itemProduct),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
