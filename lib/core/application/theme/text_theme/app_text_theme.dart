import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/fonts/app_fonts.dart';

class AppTextTheme {
  AppTextTheme._();
  static const textTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontFamily: AppFonts.pretendard,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      letterSpacing: 0.25,
      fontFamily: AppFonts.pretendard,
    ),
  );
}
