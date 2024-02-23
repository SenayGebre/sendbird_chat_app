import 'package:flutter/material.dart';

class LoadingChatList extends StatelessWidget {
  const LoadingChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 48.0,
            height: 48.0,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(height: 40.0),
          Text(
            'Loading messages...',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
