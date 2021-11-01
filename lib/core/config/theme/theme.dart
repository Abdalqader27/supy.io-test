import 'package:flutter/material.dart';
import 'package:supy_io_test/core/config/theme/text_theme.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:theme_provider/theme_provider.dart';

import 'colors.dart';

/// Light theme
final kLightMod = ThemeData(
  primaryColor: kPRIMARY,
  brightness: Brightness.light,
  backgroundColor: kWhite,
  textTheme: textTheme,
  fontFamily: Assets.fontsSstArabicBold,
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: kPRIMARY,
        secondary: kSecondary,
      ),
);

/// Dark theme
final kDarkMod = ThemeData(
  primaryColor: kPRIMARY,
  brightness: Brightness.dark,
  textTheme: textTheme,
  fontFamily: Assets.fontsSstArabicBold,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: kPRIMARY,
        secondary: kSecondary,
      ),
);

final appDarkTheme =
    AppTheme(id: 'dark_id', data: kDarkMod, description: 'dark mode');
final appLightTheme =
    AppTheme(id: 'light_id', data: kLightMod, description: 'dark mode');

final List<AppTheme> themes = [
  appDarkTheme,
  appLightTheme,
];
