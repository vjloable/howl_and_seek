import 'package:flutter/material.dart';

class CustomColors {
  static MaterialColor primaryAccent = createMaterialColor(const Color(0xFF24E1BB));
  static MaterialColor secondaryAccent = createMaterialColor(const Color(0xFF19BCBB));
  static MaterialColor primaryBackground = createMaterialColor(const Color(0xFF0C0C0C));
  static MaterialColor secondaryBackground = createMaterialColor(const Color(0xFF1B1B1B));
  static MaterialColor error = createMaterialColor(const Color(0xFFFF5454));
  static MaterialColor light = createMaterialColor(const Color(0xFFF4F4F4));

  static List<Color> lightBackground = [
    const Color(0xFF81FFE6),
    const Color(0xFFD9FFF7),
  ];

  static List<Color> strongBackground = [
    const Color(0xFFFF5454),
    const Color(0xFFFF6C6C),
  ];

  static List<Color> darkBackground = [
    const Color(0xFF111615),
    const Color(0xFF122120),
    const Color(0xFF122523),
    const Color(0xFF132220),
    const Color(0xFF111818),
  ];

  static List<Color> accentBackground = [
    CustomColors.primaryAccent,
    CustomColors.secondaryAccent,
  ];

  static List<Color> premiumBackground = [
    const Color(0xFF0C0C0C),
    const Color(0xFF1B1B1B),
  ];

  static List<Color> gold = [
    const Color(0xFF724D00),
    const Color(0xFFDB7E10),
    const Color(0xFFF6B91C),
    const Color(0xFFFFC44D),
    const Color(0xFFD89100),
  ];

  static List<Color> silver = [
    const Color(0xFFAEAEAE),
    const Color(0xFFE7E7E7),
    const Color(0xFFC6D4CF),
    const Color(0xFF717171),
    const Color(0xFF283D53),
  ];
  static List<Color> bronze = [
    const Color(0xFF934220),
    const Color(0xFF644431),
    const Color(0xFFDE7446),
    const Color(0xFFEEA291),
    const Color(0xFFA97527),
  ];
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}