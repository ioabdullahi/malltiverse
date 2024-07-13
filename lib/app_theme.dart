import 'dart:ui';
import 'package:malltiverse/utils/pref_utils.dart';

import './utils/app__export.dart';
import 'package:flutter/material.dart';



LightCodeColors get appTheme => ThemeHelper().themeColor(); 
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {

// The current app theme

var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app

Map<String, LightCodeColors> _supportedCustomColor = {

'lightCode': LightCodeColors() 
};

// A map of color schemes supported by the app 
Map<String, ColorScheme> _supportedColorScheme = { 'lightCode': ColorSchemes.lightCodeColorScheme };

/// Changes the app theme to [_newTheme].

void changeTheme (String _newTheme) {

PrefUtils().setThemeData(_newTheme);

Get.forceAppUpdate();

}

/// Returns the lightCode colors for the current theme.

LightCodeColors _getThemeColors() {

return _supportedCustomColor[_appTheme] ?? LightCodeColors();
}

/// Returns the current theme data.

ThemeData _getThemeData() {

var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

return ThemeData(
visualDensity: VisualDensity.standard,
colorScheme: colorScheme,
textTheme: TextThemes.textTheme(colorScheme),

scaffoldBackgroundColor: appTheme.gray400,

outlinedButtonTheme: OutlinedButtonThemeData(

style: OutlinedButton.styleFrom(

backgroundColor: Colors.transparent,

side: BorderSide(

color: appTheme.redA100,
width: 1,
),
shape: RoundedRectangleBorder(

borderRadius: BorderRadius.circular(14),
),
visualDensity: const VisualDensity(
 vertical: -4,
horizontal: -4
),
padding: EdgeInsets.zero,

),
),

elevatedButtonTheme: ElevatedButtonThemeData(

style: ElevatedButton.styleFrom(

 backgroundColor: appTheme.redA100,

shape: RoundedRectangleBorder(

borderRadius: BorderRadius.circular(10)

),

visualDensity: const VisualDensity(

 vertical: -4,

horizontal: -4,

),

 padding: EdgeInsets.zero,

 ),
 ),

 dividerTheme: DividerThemeData(

thickness: 1,

space: 1,

 color: appTheme.gray900.withOpacity(0.5),

),

);

}

/// Returns the lightCode colors for the current theme. LightCodeColors themeColor() => _getThemeColors();
LightCodeColors themeColor() => _getThemeColors();
/// Returns the current theme data.

ThemeData themeData() => _getThemeData();

}

/// Class containing the supported text theme styles.

class TextThemes {

static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(

bodyMedium: TextStyle(

color: appTheme.gray900.withOpacity (0.5),

fontSize: 14,
fontFamily: 'Montserrat',

fontWeight: FontWeight.w400,

),

titleLarge: TextStyle(

color: appTheme.gray900,

fontSize: 20,

fontFamily: 'Montserrat',

fontWeight: FontWeight.w600,

),

titleMedium: TextStyle(

color: appTheme.gray900,

fontSize: 19,

fontFamily: 'Montserrat',

fontWeight: FontWeight.w600,

),

titleSmall: TextStyle(

color: appTheme.gray900,

fontSize: 14,

fontFamily: 'Montserrat',

fontWeight: FontWeight.w500,

),

);

}

///Class containing the supported color schemes.

class ColorSchemes {

static final lightCodeColorScheme = ColorScheme.light();

}

/// Class containing custom colors for a lightCode theme.

class LightCodeColors{

// BlueGray

Color get blueGray900 => Color(0XFF292D32);

//GrayAa

Color get Gray200Aa => Color(0XAAECECEC);


//Gray

Color get gray400 => Color(0XFFB1B181);


Color get primaryColor => Color (0XFFFAFAFA);

Color get gray40001 => Color (0XFFBBBBBB);


Color get gray500 => Color (0XFF979797);

Color get gray900 => Color (0XFF2A2A2A);

//Orange

Color get orange300 => Color (0XFFFFC556);

//Red

Color get redA100 => Color(0XFFFF7E7D);

//White

Color get whiteA700 => Color(0XFFFFFFFF);

}