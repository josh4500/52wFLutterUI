// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SHOESHOP {
  //TextStyles
  static const TextStyle SHOECARD_TITLE = TextStyle(
    fontSize: 18,
    color: Colors.white,
  );
  static const TextStyle SHOECARD_SHOENAME = TextStyle(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle SHOECARD_SHOEPRICE = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  //SystemOverlay
  static const SystemUiOverlayStyle SYSTEMOVERLAY = SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  );
}
