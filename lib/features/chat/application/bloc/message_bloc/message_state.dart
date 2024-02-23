part of 'message_bloc.dart';

enum MessageStatus { initial, sending, sent, error }

class MessageState extends Equatable {
  final String message;
  final MessageStatus status;
  final String? error;
  const MessageState({
    required this.message,
    required this.status,
    this.error,
  });

  const MessageState.initial()
      : message = '',
        status = MessageStatus.initial,
        error = null;

  @override
  List<Object?> get props => [message, error, status];
}
