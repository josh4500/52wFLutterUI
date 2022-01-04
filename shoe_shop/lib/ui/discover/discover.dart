import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoe_shop/util/constant.dart';
import 'package:shoe_shop/widget/discover/action_button.dart';
import 'package:shoe_shop/widget/discover/animated_shoe_card.dart';
import 'package:shoe_shop/widget/discover/more_shoe_card.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<String> _filters = ["Upcoming", "Featured", "New"];
  late final PageController _pageController;
  int _selectedFilter = 1;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SHOESHOP.SYSTEMOVERLAY.copyWith(
        systemNavigationBarColor: const Color(0xFFE2E2E8),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFE2E2E8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SHOESHOP.SYSTEMOVERLAY,
          title: const Text(
            "Discover",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: const [
            ActionWidget(
              icon: Icons.search,
            ),
            ActionWidget(
              icon: Icons.notifications_outlined,
            ),
          ],
        ),
        body: DefaultTabController(
          length: 6,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: const TabBar(
                    tabs: [
                      Text("Nike"),
                      Text("Addidas"),
                      Text("Jordan"),
                      Text("Puma"),
                      Text("Addidas"),
                      Text("Jordan"),
                    ],
                    indicator: BoxDecoration(),
                    isScrollable: true,
                    unselectedLabelStyle: TextStyle(
                      color: Color(0xFFA0A0A0),
                    ),
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      color: Color(0xFFA0A0A0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 30,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                  _filters.length,
                                  (index) => GestureDetector(
                                    onTap: () => setState(() {
                                      _selectedFilter = index;
                                    }),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          _filters[index],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: _selectedFilter == index
                                                ? Colors.black
                                                : Colors.black38,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: LayoutBuilder(builder: (_, constraint) {
                                return PageView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  controller: _pageController,
                                  padEnds: false,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return AnimatedShoeCard(
                                      color: const Color(0xFF00939F),
                                      width: constraint.maxWidth,
                                      height: constraint.maxHeight,
                                      isView: index == _index,
                                    );
                                  },
                                  itemCount: 5,
                                  onPageChanged: (index) {
                                    setState(() {
                                      _index = index;
                                    });
                                  },
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "More",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_backspace),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Stack(
                                children: [
                                  ClipPath(
                                    clipper: DiscoverMoreClip(),
                                    child: Container(
                                      color: const Color(0xFFE2E2E8),
                                    ),
                                  ),
                                  Column(
                                    children: const [
                                      Expanded(
                                        child: MoreShoeCard(),
                                      ),
                                      SizedBox(
                                        height: kBottomNavigationBarHeight,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DiscoverMoreClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.9, size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
