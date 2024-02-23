part of chat_screen;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FocusNode _focusNode;
  late ChatBloc _chatBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _chatBloc = context.read<ChatBloc>();
    _chatBloc.add(InitializeChatChannel());
  }

  _scrollToBottom() {
    if (_scrollController.hasClients &&
        _scrollController.position.maxScrollExtent > 0) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 90),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageBloc(),
      child: BlocConsumer<ChatBloc, ChatState>(
        bloc: _chatBloc,
        listener: (context, chatState) {
          if (chatState.status == ChannelStatus.connected) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _focusNode.unfocus();
              _scrollToBottom();
            });
          }
          if (chatState.status == ChannelStatus.initialized) {
            _chatBloc.add(OpenChatChannel(showLoading: true));
          }
        },
        builder: (context, chatState) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar:
                _AppBar(context, chatTitle: chatState.user?.nickname ?? "..."),
            bottomNavigationBar: MessageComposser(
              focusNode: _focusNode,
              onSend: (message) {},
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 3),
                    () => _chatBloc.add(InitializeChatChannel()));
              },
              child: BlocListener<MessageBloc, MessageState>(
                listener: (context, messageState) {
                  if (messageState.status == MessageStatus.sent) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _focusNode.unfocus();
                      _scrollToBottom();
                    });
                    _chatBloc.add(OpenChatChannel(showLoading: false));
                  }
                  // TODO: implement listener
                },
                child: () {
                  if (chatState.status == ChannelStatus.initialized ||
                      chatState.status == ChannelStatus.connecting) {
                    return ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) =>
                          const LoadingChatListTile(),
                    );
                  } else if (chatState.status == ChannelStatus.connected) {
                    return _itemBuilder(context, chatState);
                  } else if (chatState.status == ChannelStatus.error) {
                    return CustomErrorWidget(
                      error: chatState.error ?? "Error",
                      onRetry: () => {
                        _chatBloc.add(InitializeChatChannel()),
                      },
                    );
                  }
                  return const SizedBox.shrink();
                }(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, ChatState state) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.messages.length,
      itemBuilder: (context, index) {
        final message = state.messages[index];
        return MessageBubble(
          key: ValueKey(message.messageId),
          message: message,
          isMine: state.user?.userId == message.sender?.userId,
        );
      },
    );
  }
}
