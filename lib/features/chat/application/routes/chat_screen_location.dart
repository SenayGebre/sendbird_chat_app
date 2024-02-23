import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sendbird_chat_app/core/application/router/app_page.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/chat_bloc.dart';
import 'package:sendbird_chat_app/features/chat/presentation/screens/index.dart';

// 
class ChatScreenLocation {
  static GoRoute get route => GoRoute(
        path: AppPage.chat.toPath,
        name: AppPage.chat.toName,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ChatBloc()..add(InitializeChatChannel()),
            child: Builder(builder: (context) {
              return const ChatScreen();
            }),
          );
        },
      );
}
