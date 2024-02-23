part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {}

class SendMessage extends MessageEvent {
  final String message;
  SendMessage(this.message);

  @override
  List<Object> get props => [message];
}
