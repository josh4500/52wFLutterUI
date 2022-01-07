import 'package:flutter/material.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Air Jordan 5 Lancy JSP',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    '\$190.00',
                    style: TextStyle(
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
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('1'),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFCBD1D8),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: IconButton(
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              // Provider.of<CartProvider>(context, listen: false)
                              //     .addItem(
                              //   CartItem(
                              //     id: '1',
                              //     name: 'Air Jordan 5 Lancy JSP',
                              //     price: 190,
                              //     imageUrl:
                              //         'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
