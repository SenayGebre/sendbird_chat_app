part of chat_screen;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(context),
      bottomNavigationBar: MessageComposer(
        focusNode: FocusNode(),
        onSendMessage: (message) {
          print(message);
        },
      ),
    );
  }
}
