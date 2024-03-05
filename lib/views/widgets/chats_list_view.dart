

import 'package:ai_chatapp/model/conversation.dart';
import 'package:ai_chatapp/views/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatefulWidget {
  final List<Conversation> conversation;
  const ChatListView({super.key, required this.conversation});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.conversation.length,
      itemBuilder: (context, index) {
        Conversation conversation = widget.conversation[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MessageWidget(text: conversation.question),
            const SizedBox(height: 32),
            MessageWidget(text: conversation.answers, fromAi: true)
          ],
        );
      });
  }
}