import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  double get width =>  MediaQuery.of(this).size.width;

  double get height =>  MediaQuery.of(this).size.height;

  ColorScheme get colorScheme => theme.colorScheme;

  bool get isMobile => mediaQuery.size.width < 768;

  bool get isTablet => mediaQuery.size.width >= 768 && mediaQuery.size.width < 1024;

  bool get isDesktop => mediaQuery.size.width >= 1024;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  bool get isLightMode => theme.brightness == Brightness.light;

  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
}
