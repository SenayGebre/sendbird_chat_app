part of chat_screen;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ScrollController _scrollController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    context.read<ChatBloc>().add(InitializeChatChannel());
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
      create: (_) => MessageBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _AppBar(context,
              chatTitle:
                  context.watch<ChatBloc>().state.user?.nickname ?? "..."),
          bottomNavigationBar: BlocListener<MessageBloc, MessageState>(
            listener: _messageBlocListener,
            child: MessageComposser(
              focusNode: _focusNode,
              onSend: (message) {
                context.read<MessageBloc>().add(SendMessage(message));
              },
            ),
          ),
          body: BlocConsumer<ChatBloc, ChatState>(
            listener: _chatBlocListener,
            builder: (context, chatState) {
              return _buildChatContent(context, chatState);
            },
          ),
        );
      }),
    );
  }

  Widget _buildChatContent(BuildContext context, ChatState chatState) {
    if (chatState.status == ChannelStatus.connected) {
      context.read<MessageBloc>().add(SetChannel(chatState.channel!));
      return _itemBuilder(chatState);
    } else if (chatState.status == ChannelStatus.error) {
      return CustomErrorWidget(
        error: chatState.error ?? "Error",
        onRetry: () => context.read<ChatBloc>().add(InitializeChatChannel()),
      );
    } else {
      return const LoadingChatList();
    }
  }

  Widget _itemBuilder(ChatState state) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(const Duration(seconds: 3),
            () => context.read<ChatBloc>().add(InitializeChatChannel()));
      },
      child: ListView.builder(
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
      ),
    );
  }

  void _messageBlocListener(BuildContext context, MessageState state) {
    if (state.status == MessageStatus.sent) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.unfocus();
        _scrollToBottom();
      });
      context.read<ChatBloc>().add(OpenChatChannel(showLoading: false));
    }
  }

  void _chatBlocListener(BuildContext context, ChatState state) {
    if (state.status == ChannelStatus.connected) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.unfocus();
        _scrollToBottom();
      });
    }
    if (state.status == ChannelStatus.initialized) {
      context.read<ChatBloc>().add(OpenChatChannel(showLoading: true));
    }
  }
}
