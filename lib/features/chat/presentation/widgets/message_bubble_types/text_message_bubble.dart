import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/index.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class TextMessageBubble extends StatelessWidget {
  final BaseMessage message;
  final String? messageText;

  const TextMessageBubble({Key? key, required this.message, this.messageText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16)),
        color: AppColors.grey300,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Text(message.message,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.othersWhite,
          )),
    );
  }
}
