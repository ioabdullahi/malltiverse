import 'package:flutter/material.dart';
import 'package:malltiverse/utils/app__export.dart';

class AppDecoration {
//Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray500,
      );
  static BoxDecoration get fillGray400 => BoxDecoration(
        color: appTheme.gray400,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900.withOpacity(0.95),
      );
  static BoxDecoration get fillGrayAa => BoxDecoration(
        color: appTheme.Gray200Aa,
      );
  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA100,
      );
// Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        border: Border.all(
          color: appTheme.gray900.withOpacity(0.1),
          width: 1,
        ),
      );
}

class BorderRadiusStyle {
// Circle borders

  static BorderRadius get circleBorder46 => BorderRadius.circular(
        46.0,
      );

// Rounded borders

  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.0,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.0,
      );

  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5,
      );
}
