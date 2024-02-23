import 'package:flutter/material.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

import 'package:sendbird_chat_app/core/domain/entities/entity.dart';

class MessageStatusData {
  IconData iconData;
  Color color;
  MessageStatusData({required this.iconData, required this.color});
}

class MessagePayloadEntity extends Entity {
  final User? user;
  final OpenChannel? openChannel;

  final bool hasPrevious;
  final List<BaseMessage> messageList;
  final PreviousMessageListQuery query;

  const MessagePayloadEntity({
    this.user,
    this.openChannel,
    this.hasPrevious = false,
    this.messageList = const [],
    required this.query,
  });

  // copywith method
  MessagePayloadEntity copyWith({
    User? user,
    OpenChannel? openChannel,
    bool? hasPrevious,
    List<BaseMessage>? messageList,
    PreviousMessageListQuery? query,
  }) {
    return MessagePayloadEntity(
      user: user ?? this.user,
      openChannel: openChannel ?? this.openChannel,
      hasPrevious: hasPrevious ?? this.hasPrevious,
      messageList: messageList ?? this.messageList,
      query: query ?? this.query,
    );
  }

  @override
  String? get id => throw UnimplementedError();

  @override
  List<Object?> get props =>
      [user, openChannel, hasPrevious, messageList, query];
}
