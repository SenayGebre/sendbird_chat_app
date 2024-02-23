import 'package:go_router/go_router.dart';
import 'package:sendbird_chat_app/core/router/app_page.dart';
import 'package:sendbird_chat_app/features/chat/presentation/screens/chat_screen.dart';

class ChatScreenLocation {
  static GoRoute get route => GoRoute(
        path: AppPage.chat.toPath,
        name: AppPage.chat.toName,
        builder: (context, state) {
          return const ChatScreen();
        },
      );
}
