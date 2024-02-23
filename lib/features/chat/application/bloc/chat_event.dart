part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {}

class InitializeChatChannel extends ChatEvent {
  @override
  List<Object> get props => [];
}

class FetchChatMessages extends ChatEvent {
  @override
  List<Object> get props => [];
}

class OpenChatChannel extends ChatEvent {
  final bool showLoading;
  OpenChatChannel({this.showLoading = true});

  @override
  List<Object> get props => [showLoading];
}

class SendMessage extends ChatEvent {
  final String message;
  SendMessage(this.message);

  @override
  List<Object> get props => [message];
}
