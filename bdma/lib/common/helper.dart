import 'package:flutter/cupertino.dart';

class SizeConfig {
  MediaQueryData _mediaQueryData;

  static double ScreenHeight = 0.0;
  static double ScreenWidth = 0.0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    ScreenHeight = _mediaQueryData.size.height;
    ScreenWidth = _mediaQueryData.size.width;
  }
}
