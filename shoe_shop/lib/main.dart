import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_shop/provider/cart_provider.dart';
import 'package:shoe_shop/provider/liked_provider.dart';

import 'ui/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => LikedProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
        home: const HomePage(),
      ),
    );
  }
}
