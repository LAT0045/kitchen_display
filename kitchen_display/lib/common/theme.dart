import 'package:flutter/material.dart';
import 'package:kitchen_display/utils/colors.dart';

final appTheme = ThemeData(
  colorSchemeSeed: AppColors.orangeColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Comfortaa',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    ),
  ),
);
