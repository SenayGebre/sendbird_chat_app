import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/chat_bloc.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/message_time_and_status_widget.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

class UserMessageBubble extends StatelessWidget {
  final BaseMessage message;
  final VoidCallback onTap;
  const UserMessageBubble(
      {Key? key, required this.message, required this.onTap})
      : super(key: key);

  String? get name =>
      message.sender?.nickname != null && message.sender?.nickname != ''
          ? message.sender?.nickname
          : 'Anonyms';

  @override
  Widget build(BuildContext context) {
    var chatBloc = context.watch<ChatBloc>();
    bool isMine = chatBloc.state.user?.userId == message.sender?.userId;
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message.sender?.profileUrl == null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                radius: 20, // Set the radius as needed
                backgroundImage: NetworkImage(message.sender!.profileUrl),
              ),
            )
          else
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                radius: 20,
                child:
                    Icon(Icons.person_2_outlined), // Set the radius as needed
              ),
            ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  color: (Colors.grey[900]),
                ),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                    Text(
                      message.message,
                      style: const TextStyle(
                          color: AppColors.othersWhite, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ChatTimeAndStatusWidget(
                    message: message,
                    isMine: isMine,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
