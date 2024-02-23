import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/chat_bloc.dart';

class MessageComposser extends StatefulWidget {
  const MessageComposser({
    super.key,
    required this.focusNode,
    required this.onSend,
  });
  final FocusNode focusNode;
  final ValueChanged<String> onSend;

  @override
  State<MessageComposser> createState() => _MessageComposserState();
}

class _MessageComposserState extends State<MessageComposser> {
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
    var bloc = context.watch<ChatBloc>();
    return Material(
      color: AppColors.othersBlack,
      elevation: 9,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                //TODO handle file uploader
              },
              icon: const Icon(Icons.add, color: AppColors.grey300),
            ),
            Expanded(
              child: TextField(
                autofocus: false,
                controller: _messageController,
                focusNode: widget.focusNode,
                style: const TextStyle(color: AppColors.othersWhite),
                decoration: InputDecoration(
                  suffixIcon: _hasContent && bloc.state.user?.userId != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 7.0, bottom: 7.0, right: 8.0),
                          child: InkWell(
                            onTap: () => widget.onSend(_messageController.text),
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary900,
                              ),
                              child: Padding(
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
                  hintText: 'Enter a message',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
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
