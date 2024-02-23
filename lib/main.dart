import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sendbird_chat_app/app/sendbird_chat_app.dart';
import 'package:sendbird_chat_app/core/configs/app_configs.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (errorDetails) {
        debugPrint('[FlutterError] ${errorDetails.stack}');

        //TODO: Remove this condition in production
        if (kDebugMode) {
          Fluttertoast.showToast(
            msg: '[FlutterError] ${errorDetails.stack}',
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      };

      // Initialize third party packages( i.e: Sendbird Chat SDK )
      await _initDependencies();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
          // systemNavigationBarColor: PresetColors.whiteColor, // navigation bar color
          // statusBarColor: PresetColors.primaryColorBlue, // status bar color
        ),
      );
      runApp(const SendbirdChatApp());
    },
    (error, stackTrace) async {
      debugPrint('[Error] $error\n$stackTrace');

      //TODO: Remove this condition in production
      if (kDebugMode) {
        Fluttertoast.showToast(
          msg: '[Error] $error',
          gravity: ToastGravity.CENTER,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    },
  );
}

Future<void> _initDependencies() async {
  await dotenv.load();
  await SendbirdChat.init(
    appId: AppConfigs.APP_ID,
    options: SendbirdChatOptions(
      useCollectionCaching: true,
      // TODO: setup typing indicator
      // typingIndicatorThrottle: 1000,
    ),
  );
}
