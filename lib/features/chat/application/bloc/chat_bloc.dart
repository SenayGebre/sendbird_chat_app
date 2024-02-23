import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  // this is sample user id for testing purpose. The real user id should be fetched from the server or from the user's device storage after authentication.
  static const _myUserId = "sampleUserId900";

  // this is sample open channel url for testing purpose. The real open channel url should be fetched from the server.
  static const _channelUrl =
      "sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211";

  static const _myUserNickname = "잘 지내다";

  User? user;
  OpenChannel? _openChannel;
  List<BaseMessage> _messages = [];

  ChatBloc() : super(const ChatState.initial()) {
    on<InitializeChatChannel>(_onInitializeChatChannel);
    on<OpenChatChannel>(_onOpenChatChannel);
    // on<SendMessage>(_onSendMessage);
  }

  Future<void> _onInitializeChatChannel(
      InitializeChatChannel event, Emitter<ChatState> emit) async {
    try {
      emit(state.copyWith(status: ChannelStatus.initializing));
      user = await SendbirdChat.connect(_myUserId, nickname: _myUserNickname);
      emit(
        state.copyWith(
          status: ChannelStatus.initialized,
          user: user,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ChannelStatus.error,
          user: user,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onOpenChatChannel(
      OpenChatChannel event, Emitter<ChatState> emit) async {
    if (event.showLoading) {
      emit(state.copyWith(status: ChannelStatus.connecting));
    } else {
      emit(state.copyWith(
          status: ChannelStatus.connected,
          channel: _openChannel,
          messages: _messages));
    }

    try {
      _openChannel = await OpenChannel.getChannel(_channelUrl);
      await _openChannel!.enter();
      final messages = await PreviousMessageListQuery(
        channelType: ChannelType.open,
        channelUrl: _channelUrl,
      ).next();
      _messages = messages;

      emit(state.copyWith(
          status: ChannelStatus.connected,
          channel: _openChannel,
          messages: _messages));
    } catch (e) {
      emit(state.copyWith(
        status: ChannelStatus.error,
      ));
    }
  }

  // Future<void> _onSendMessage(
  //     SendMessage event, Emitter<ChatState> emit) async {
  //   try {
  //     if (_openChannel == null) {
  //       throw Exception("OpenChannel instance is null");
  //     }
  //     _openChannel!
  //         .sendUserMessage(UserMessageCreateParams(message: event.message));
  //     emit(ChatMessageSentState());
  //   } catch (e) {
  //     emit(ErrorOccurredState(e.toString()));
  //   }
  // }
}
