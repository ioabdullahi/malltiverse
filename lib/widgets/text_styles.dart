import 'package:flutter/material.dart';
import 'package:malltiverse/app_theme.dart';

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}

class CustomTextStyles {
// Body text style

  static get bodyMediumGray900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray900,
      );

  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.0,
      );

  static get bodySmallGray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900.withOpacity(0.67),
      );

  static get bodySmallGray900_1 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900.withOpacity(0.67),
      );

  static get bodySmallGray900_2 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray900.withOpacity(0.4),
      );

  static get bodySmallPoppinsGray50 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.gray50,
        fontSize: 11.0,
      );
  static get labelLargeGray50 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50,
        fontWeight: FontWeight.w500,
      );

  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900.withOpacity(0.8),
        fontWeight: FontWeight.w500,
      );

  static get labelLargeInter => theme.textTheme.labelLarge!.inter;

  static get labelLargeMedium => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static get labelLargeRedA100 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.redA100,
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      );

// Title text style

  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22.0,
      );

  static get titleLargeGray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray50,
        fontSize: 20.0
      );

  static get titleLargePoppinsGray50 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.gray500,
        fontSize: 22.0,
      );

  static get titleMedium16 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.0,
      );

  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.0,
      );

  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumPoppinsGray50 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray500,
        fontSize: 16.0,
      );

  static get titleSmallGray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900.withOpacity(0.8),
        fontWeight: FontWeight.w600,
      );

  static get titleSmallGray900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900.withOpacity(0.64),
      );

  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
}
