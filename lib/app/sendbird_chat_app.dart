import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sendbird_chat_app/core/presentation/screens/something_went_wrong_screen.dart';
import 'package:sendbird_chat_app/core/theme/theme.dart';
import 'package:sendbird_chat_app/features/chat/presentation/screens/chat_screen.dart';

class SendbirdChatApp extends StatelessWidget {
  const SendbirdChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Send Bird Chat App',
          locale: const Locale('ko', 'KR'),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: const ChatScreen(),
        );
      },
    );
  }

  Widget getErrorWidget(
      BuildContext context, FlutterErrorDetails errorDetails) {
    return const SomethingWentwrongScreen();
  }
}
