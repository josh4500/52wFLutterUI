import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_shop/util/constant.dart';

class ShoeDetails extends StatefulWidget {
  const ShoeDetails({Key? key}) : super(key: key);

  @override
  _ShoeDetailsState createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SHOESHOP.SYSTEMOVERLAY.copyWith(
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.cyan,
          systemOverlayStyle: SHOESHOP.SYSTEMOVERLAY.copyWith(
            statusBarColor: Colors.cyan,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_rounded),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
