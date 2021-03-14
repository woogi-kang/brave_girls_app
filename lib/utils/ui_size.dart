import 'package:flutter/widgets.dart';

class UISizeConfig {

  UISizeConfig();

  // iPhone6 Resolution
  static const double designScreenWidth = 375;
  static const double designScreenHeight = 667;

  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static double? screenForDesignHorizontal;
  static double? screenForDesignVertical;
  static double? screenForDesign;

  static double? _fontForDesign;
  static double? _fontForScreen;
  static double? screenFontForDesign;

  static double? _safeAreaHorizontal;
  static double? _safeAreaVertical;
  static double? safeBlockHorizontal;
  static double? safeBlockVertical;

  static double? _expandWidth;
  static double? _expandHeight;

  static double? _safeAreaTop;
  static double? _safeAreaBottom;

  static bool? _isCheckiPhone6 = false;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = _screenWidth! / 100;
    blockSizeVertical = _screenHeight! / 100;

    screenForDesignHorizontal = _screenWidth!/designScreenWidth;
    screenForDesignVertical = _screenHeight!/designScreenHeight;

    screenForDesign = screenForDesignHorizontal;

    _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeBlockHorizontal = (_screenWidth! - _safeAreaHorizontal!) / 100;
    safeBlockVertical = screenForDesignVertical;

    _expandWidth = _screenWidth! - designScreenWidth;
    _expandHeight = _screenHeight! - designScreenHeight;

    _fontForDesign = designScreenHeight/designScreenWidth;
    _fontForScreen = _screenHeight!/_screenWidth!;

    //
    screenFontForDesign = (_fontForScreen!/_fontForDesign!);

    _safeAreaTop = _mediaQueryData!.padding.top;
    _safeAreaBottom = _mediaQueryData!.padding.bottom;
  }


  static double get screenHeight => _isCheckiPhone6! ? size(667) : _screenHeight!;
  static double get screenWidth => _screenWidth!;

  static double size(double size, {bool isTruncate = true})
  {
    if((size * screenForDesign!) < 1.0 && size >= 1.0 ) return size;

    if(isTruncate) return (size * screenForDesign!).truncateToDouble();

    return (size * screenForDesign!);
  }

  static double sizeFont(double size)
  {
    return size;
  }

  static double expandWidth(double width)
  {
    return (width + _expandWidth!).truncateToDouble();
  }

  static double expandHeight(double height)
  {
    return (height + _expandHeight!).truncateToDouble();
  }

  static double getScreenHeight(double height)
  {
    return (height * safeBlockVertical!).truncateToDouble();
  }

  static double getScreenWidth(double width)
  {
    return (width * screenForDesignHorizontal!).truncateToDouble();
  }

  static double safeTop()
  {
    if(_isCheckiPhone6 == true) return 0;

    return _safeAreaTop!;
  }

  static double safeBottom()
  {
    if(_isCheckiPhone6 == true) return 0;

    return _safeAreaBottom!;
  }

  static bool isCheckiPhone6()
  {
    return _isCheckiPhone6!;
  }

  static void setCheckiPhone6(bool isCheck)
  {
    _isCheckiPhone6 = isCheck;
  }
}

extension UISizeDouble on double {
  double get s {
    return UISizeConfig.size(this);
  }

  double get fs {
    return UISizeConfig.sizeFont(this);
  }
}

extension UISizeInt on int {
  double get s {
    return UISizeConfig.size(this.toDouble());
  }

  double get fs {
    return UISizeConfig.sizeFont(this.toDouble());
  }
}