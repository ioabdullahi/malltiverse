import 'package:flutter/material.dart';

class CustomButtonStyles{
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent)
    )
  );
}