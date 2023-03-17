import 'package:flutter/material.dart';
import 'package:login/res/color_manager.dart';

class AllThemeManager {
  static ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorManager.primaryColor,
      onPrimary: ColorManager.whiteColor,
      secondary: ColorManager.primaryColor,
      onSecondary: ColorManager.whiteColor,
      error: ColorManager.redColor,
      onError: ColorManager.redColor,
      background: ColorManager.whiteColor,
      onBackground: ColorManager.primaryColor,
      surface: ColorManager.primaryColor,
      onSurface: ColorManager.whiteColor,
    ),
  );
}
