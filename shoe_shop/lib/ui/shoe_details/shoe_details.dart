import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_shop/util/constant.dart';

class ShoeDetails extends StatefulWidget {
  const ShoeDetails({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _ShoeDetailsState createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  final List<double> _ukShoeSize = [7.5, 8.5, 9.5, 10.5, 11.5, 12.5];
  final List<int> _usShoeSize = [38, 39, 40, 41, 42];

  bool _isUk = true;
  bool _scaleButton = false;
  bool _willStopScale = false;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SHOESHOP.SYSTEMOVERLAY.copyWith(
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFAFA),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_rounded),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Hero(
                      tag: "Discover${widget.index}",
                      transitionOnUserGestures: true,
                      child: Material(
                        type: MaterialType.transparency,
                        child: ClipPath(
                          clipper: CustomShoeDetailsClipper(),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(children: [
                      Expanded(
                        child: Container(
                            // color: Colors.red,
                            ),
                      )
                    ]),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Nike Air Max",
                                style: TextStyle(
                                  color: Color(0xFF282828),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              "\$150.00",
                              style: TextStyle(
                                color: Color(0xFF282828),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "The Nike Air-Max 270 is amps up an icon with a hug Max Air unit"
                            "for coshioning under every step. It features a stretchy inner sleeves"
                            "foa a snug, sock-like fit.",
                            style: TextStyle(
                              color: Color(0xFF949494),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "More Details",
                            style: TextStyle(
                              color: Color(0xFF282828),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "Size",
                                style: TextStyle(
                                  color: Color(0xFF282828),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _changeShoeSizeCountry,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "UK",
                                  style: TextStyle(
                                    color: _isUk
                                        ? const Color(0xFF282828)
                                        : Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _changeShoeSizeCountry,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "USA",
                                  style: TextStyle(
                                    color: _isUk
                                        ? Colors.grey
                                        : const Color(0xFF282828),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  "Try it",
                                  style: TextStyle(
                                      color: Color(0xFF282828),
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.forward_to_inbox_rounded,
                                    color: Color(0xFF282828),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                _isUk ? _ukShoeSize.length : _usShoeSize.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 10.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Text(
                                      _isUk
                                          ? _ukShoeSize[index].toString()
                                          : _usShoeSize[index].toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF282828),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: _scaleButton
                          ? _willStopScale
                              ? 1
                              : 0.9
                          : 1.0,
                      onEnd: () {
                        if (!_willStopScale) {
                          setState(() {
                            _willStopScale = true;
                          });
                        }
                      },
                      curve: Curves.easeInOut,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _scaleButton = !_scaleButton;
                            _willStopScale = false;
                          });
                        },
                        child: const Text("Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                          maximumSize: MaterialStateProperty.all(
                            const Size.fromHeight(50),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEA2E57),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _changeShoeSizeCountry() {
    setState(() {
      _isUk = !_isUk;
    });
  }
}

class CustomShoeDetailsClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width, 0);
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width * 0.7, -(size.height * 0.65)),
        radius: size.height * 1.5,
      ),
    );
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
