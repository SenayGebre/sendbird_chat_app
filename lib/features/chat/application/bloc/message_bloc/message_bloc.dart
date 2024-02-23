import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState.initial()) {
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessageState> emit) async {
    try {
      // _openChannel!
      //     .sendUserMessage(UserMessageCreateParams(message: event.message));
      // emit(ChatMessageSentState());
    } catch (e) {
      // emit(ErrorOccurredState(e.toString()));
    }
  }
}
