part of 'chat_bloc.dart';

enum ChannelStatus {
  initial,
  initializing,
  initialized,
  connecting,
  connected,
  error
}

class ChatState extends Equatable {
  final ChannelStatus status;
  final OpenChannel? channel;
  final User? user;
  final List<BaseMessage> messages;
  final String? error;
  const ChatState({
    required this.status,
    this.user,
    this.channel,
    this.messages = const [],
    this.error,
  });

  const ChatState.initial()
      : status = ChannelStatus.initial,
        channel = null,
        user = null,
        messages = const [],
        error = null;

  // copywith method
  ChatState copyWith({
    ChannelStatus? status,
    OpenChannel? channel,
    List<BaseMessage>? messages,
    String? error,
    User? user,
  }) {
    return ChatState(
      status: status ?? this.status,
      channel: channel ?? this.channel,
      messages: messages ?? this.messages,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        channel,
        user,
        messages,
        error,
      ];
}
