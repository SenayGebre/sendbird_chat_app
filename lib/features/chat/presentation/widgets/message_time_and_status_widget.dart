import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';
import 'package:sendbird_chat_app/core/application/utils/date_parser.dart';
import 'package:sendbird_chat_app/features/chat/domain/entities/message_payload_entity.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class ChatTimeAndStatusWidget extends StatelessWidget {
  final BaseMessage message;
  final bool isMine;
  const ChatTimeAndStatusWidget(
      {Key? key, required this.message, required this.isMine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = getIconData(message.sendingStatus!);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          parseDate(message.createdAt),
          style: const TextStyle(
            color: AppColors.grey100,
            fontSize: 8,
          ),
        ),
        const SizedBox(width: 4),
        if (isMine)
          Icon(
            icon.iconData,
            color: AppColors.othersWhite,
            size: 12,
          ),
      ],
    );
  }

  MessageStatusData getIconData(SendingStatus status) {
    switch (status) {
      case SendingStatus.failed || SendingStatus.canceled:
        return MessageStatusData(
            iconData: Icons.error, color: AppColors.failedAlert);
      case SendingStatus.succeeded:
        return MessageStatusData(
            iconData: Icons.done, color: AppColors.grey100);
      case SendingStatus.pending:
        return MessageStatusData(
            iconData: Icons.pending, color: AppColors.primary800);
      default:
        return MessageStatusData(
          iconData: Icons.access_time,
          color: AppColors.grey100,
        );
    }
  }
}
