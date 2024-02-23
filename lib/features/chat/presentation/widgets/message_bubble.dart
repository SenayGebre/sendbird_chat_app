import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/message_bubble_builder.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class MessageBubble extends StatelessWidget {
  final BaseMessage message;
  final bool isMine;
  const MessageBubble({Key? key, required this.message, this.isMine = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (isMine ? Alignment.topRight : Alignment.topLeft),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            messageContentBuilder(
              message,
              type:
                  isMine ? MessageTypes.textMessage : MessageTypes.userMessage,
            )
          ],
        ),
      ),
    );
  }
}
