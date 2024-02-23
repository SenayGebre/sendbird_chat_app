import 'package:flutter/material.dart';

class LoadingChatListTile extends StatelessWidget {
  const LoadingChatListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                const CircleAvatar(child: Icon(Icons.person)),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 20, width: 100, color: Colors.white),
                    const SizedBox(height: 8),
                    Container(height: 16, width: 200, color: Colors.white),
                  ],
                ),
                const Divider(color: Colors.white)
              ],
            ),
          ),
          Container(height: 14, width: 70, color: Colors.white)
        ],
      ),
    );
  }
}
