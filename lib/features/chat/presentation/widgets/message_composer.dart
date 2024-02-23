import 'package:flutter/material.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';

class MessageComposer extends StatefulWidget {
  const MessageComposer({
    super.key,
    required this.focusNode,
    required this.onSendMessage,
  });
  final FocusNode focusNode;
  final ValueChanged<String> onSendMessage;

  @override
  State<MessageComposer> createState() => _MessageComposerState();
}

class _MessageComposerState extends State<MessageComposer> {
  bool _hasContent = false;
  late TextEditingController _messageController;

  void _updateHasText() {
    setState(() {
      _hasContent = _messageController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();

    _messageController.addListener(_updateHasText);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.black,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              //TODO handle file uploader
            },
            icon: const Icon(Icons.add, color: AppColors.grey300),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: AppColors.greyscale700,
                border: Border.all(color: Colors.white24),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              child: TextField(
                autofocus: false,
                controller: _messageController,
                focusNode: widget.focusNode,
                style: const TextStyle(color: AppColors.othersWhite),
                decoration: InputDecoration(
                  hintText: "Type message",
                  hintStyle: const TextStyle(color: AppColors.grey400),
                  border: InputBorder.none,
                  suffix: _hasContent
                      ? InkWell(
                          onTap: () =>
                              widget.onSendMessage(_messageController.text),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12.0, top: 2),
                            child: Container(
                              width: 30,
                              decoration: const BoxDecoration(
                                  color: AppColors.primary900,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.arrow_upward_rounded,
                                  color: AppColors.greyscale900,
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.removeListener(_updateHasText);
    _messageController.dispose();
    super.dispose();
  }
}
