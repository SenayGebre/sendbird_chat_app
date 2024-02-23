import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';
import 'package:sendbird_chat_app/core/application/theme/text_theme/app_text_theme.dart';

// TODO: for better theme management, consider separating the light theme and dark theme into different files
class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary900,
      brightness: Brightness.light,
    ).copyWith(),
    textTheme: AppTextTheme.textTheme,
  );

  static final ThemeData darkTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary900,
      brightness: Brightness.dark,
    ).copyWith(),
    textTheme: AppTextTheme.textTheme,
  );
}
