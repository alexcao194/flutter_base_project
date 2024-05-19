import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF0048A8);
  static const secondary = Color(0xFFE083EA);
  static const tertiary = Colors.black45;

  static const first = Color(0x9E703F00);
  static const second = Color(0x9EA2A800);
  static const third = Color(0x9E000865);

  static const firstContainer = Colors.orange;
  static const secondContainer = Colors.green;
  static const thirdContainer = Colors.purple;

  static const listBackground = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.tealAccent,
  ];
}

class AppGradients {
  AppGradients._();
  static const background = LinearGradient(
    colors: [
      Color(0xFF0048A8),
      Color(0xFFE083EA)
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}