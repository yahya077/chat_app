import 'package:flutter/material.dart';

class Style {
  // Colors
  static final Color primaryColor = Color(0xff4382d8);
  static final Color secondaryColor = Color(0xff2facd6);
  static final Color darkColor = Color(0xff151515);
  static final List<Color> gradientColor = [primaryColor, secondaryColor];

  // Text Style
  static final TextStyle appNameTextStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.white);

  // Decoration
  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white)),
    );
  }
}
