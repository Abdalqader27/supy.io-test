import 'package:flutter/material.dart';
import 'package:supy_io_test/common/config/theme/text_theme.dart';
import 'package:supy_io_test/generated/assets.dart';
import 'package:theme_provider/theme_provider.dart';

import '../styles/card_styles.dart';
import 'colors.dart';

/// Light theme
final kLightMod = ThemeData(
  primaryColor: kPRIMARY,
  brightness: Brightness.light,
  backgroundColor: kWhite,
  scaffoldBackgroundColor: kWhite,
  textTheme: textTheme,
  fontFamily: Assets.fontsSstArabicBold,
  iconTheme: const IconThemeData(color: kPRIMARY),
  primaryIconTheme: const IconThemeData(color: kPRIMARY),
  cardTheme: kCardStyle1,
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
  cardTheme: kCardStyle1,
  primaryIconTheme: const IconThemeData(color: kPRIMARY),
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
