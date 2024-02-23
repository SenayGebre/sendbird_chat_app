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
  ).copyWith(
    textTheme: AppTextTheme.textTheme,
  );

  static final ThemeData darkTheme = ThemeData.from(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary900,
      brightness: Brightness.dark,
      background: const Color.fromARGB(255, 15, 0, 6),
    ).copyWith(),
  ).copyWith(
      textTheme: AppTextTheme.textTheme,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.othersWhite, width: 0.8),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.othersWhite, width: 0.8),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.othersWhite, width: 1.2),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 100, 100, 100),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.othersBlack,
      ),
      appBarTheme: const AppBarTheme(color: AppColors.othersBlack));
}
