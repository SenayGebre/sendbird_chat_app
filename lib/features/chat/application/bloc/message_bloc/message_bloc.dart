import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState.initial()) {
    on<SetChannel>(_onSetChannel);
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onSendMessage(
      SendMessage event, Emitter<MessageState> emit) async {
    try {
      emit(state.copyWith(status: MessageStatus.sent));

      if (state.openChannel == null) {
        throw Exception("OpenChannel instance is null");
      }
      state.openChannel!
          .sendUserMessage(UserMessageCreateParams(message: event.message));
      emit(state.copyWith(status: MessageStatus.sent));
    } catch (e) {
      emit(state.copyWith(status: MessageStatus.error, error: e.toString()));
    }
  }

  FutureOr<void> _onSetChannel(SetChannel event, Emitter<MessageState> emit) {
    emit(state.copyWith(openChannel: event.openChannel));
  }
}
