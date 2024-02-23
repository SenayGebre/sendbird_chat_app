import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sendbird_chat_app/core/application/router/app_router.dart';
import 'package:sendbird_chat_app/core/presentation/screens/something_went_wrong_screen.dart';
import 'package:sendbird_chat_app/core/application/theme/theme.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/chat_bloc.dart';

class SendbirdChatApp extends StatelessWidget {
  const SendbirdChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Error handling for the entire app using FlutterError.onError callback method and an error widget.
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return getErrorWidget(context, errorDetails);
    };

    // ScreenUtilInit is a widget that provides a configuration for the ScreenUtil class. This will handle the app responsiveness.
    return MultiProvider(
      providers: [
        Provider<AppRouter>(
          lazy: true,
          create: (_) => AppRouter(),
        ),

        // TODO: this will be moved to chat_screen_location file in the future.
        BlocProvider(
          create: (context) => ChatBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final GoRouter goRouter =
              Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            routerConfig: goRouter,
            debugShowCheckedModeBanner: false,
            title: 'Send Bird Chat App',

            // This can be configured using flutter internationalization to be dynamic based on the user's language preference.
            locale: const Locale('ko', 'KR'),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,

            // This will be configured to be dynamic based on the user's theme preference.
            themeMode: ThemeMode.dark,
          );
        },
      ),
    );
  }

  // This method will return an error widget when an error occurs in the app.
  Widget getErrorWidget(
      BuildContext context, FlutterErrorDetails errorDetails) {
    return const SomethingWentwrongScreen();
  }
}
