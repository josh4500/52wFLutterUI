import 'package:flutter/material.dart';

class ShoeDisplaySlideShow extends StatefulWidget {
  const ShoeDisplaySlideShow({Key? key}) : super(key: key);

  @override
  _ShoeDisplaySlideShowState createState() => _ShoeDisplaySlideShowState();
}

class _ShoeDisplaySlideShowState extends State<ShoeDisplaySlideShow> {
  final List<String> _items = [
    'assets/images/shoe1.jpg',
    'assets/images/shoe2.jpg',
    'assets/images/shoe3.jpg',
    'assets/images/shoe3.jpg',
    'assets/images/shoe3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.black.withOpacity(0.05),
              ),
              width: constraint.maxWidth * 0.25,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/nike.png'),
                  if (index == _items.length - 1)
                    Container(
                      width: constraint.maxWidth * 0.25 * 0.33,
                      height: constraint.maxWidth * 0.25 * 0.33,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: constraint.maxWidth * 0.25 * 0.33 * 0.5,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
        itemCount: _items.length,
      );
    });
  }
}
