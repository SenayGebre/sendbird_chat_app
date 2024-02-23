part of 'message_bloc.dart';

enum MessageStatus { initial, sending, sent, error }

class MessageState extends Equatable {
  final String message;
  final MessageStatus status;
  final String? error;
  final OpenChannel? openChannel;

  const MessageState({
    required this.message,
    required this.openChannel,
    required this.status,
    this.error,
  });

  const MessageState.initial()
      : message = '',
        status = MessageStatus.initial,
        openChannel = null,
        error = null;

  MessageState copyWith({
    String? message,
    MessageStatus? status,
    OpenChannel? openChannel,
    String? error,
  }) {
    return MessageState(
      openChannel: openChannel ?? this.openChannel,
      message: message ?? this.message,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [message, error, status, openChannel];
}
