// ignore_for_file: non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sendbird_chat_app/core/application/constants/var_keys.dart';

class AppConfigs {
  static final String APP_ID = dotenv.env[VarKeys.APP_ID] ?? "";
  static final CHANNEL_URL = dotenv.env[VarKeys.CHANNEL_URL];
}
