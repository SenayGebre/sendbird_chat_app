import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sendbird_chat_app/core/application/router/app_page.dart';
import 'package:sendbird_chat_app/core/presentation/screens/error_screen.dart';
import 'package:sendbird_chat_app/core/presentation/screens/something_went_wrong_screen.dart';
import 'package:sendbird_chat_app/features/chat/application/routes/chat_screen_location.dart';

class AppRouter {

  // Singleton instance, helps to avoid multiple instances of the class
  static AppRouter? _instance;
  factory AppRouter() {
    _instance ??= AppRouter._();
    return _instance!;
  }

  // Private constructor, helps to make the class singleton and avoid multiple instances
  AppRouter._();


  GoRouter get router => _goRouter;

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  late final GoRouter _goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    observers: kDebugMode ? <NavigatorObserver>[RouteObserver()] : null,
    initialLocation: AppPage.chat.toPath,
    routes: <RouteBase>[
      ChatScreenLocation.route,
    ],
    errorBuilder: (context, state) {
      //TODO: This will be removed in production (chat app)
      if (kDebugMode) {
        return ErrorScreen(state.error ?? Exception());
      }
      return const SomethingWentwrongScreen();
    },
    restorationScopeId: 'router',
  );
}
