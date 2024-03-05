import 'dart:convert';

import 'package:ai_chatapp/constants/colors.dart';
import 'package:ai_chatapp/model/conversation.dart';
import 'package:ai_chatapp/views/widgets/chats_list_view.dart';
import 'package:ai_chatapp/views/widgets/chats_widget.dart';
import 'package:ai_chatapp/views/widgets/example_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SizedBox(
          width:  double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if(!isConversationStarted)...[
                const SizedBox(height: 30),
                Image.asset("images/mylogo.png"),
                const SizedBox(height: 24),
                Text('Welcome to \nChatGPT',
                style: textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Text('Ask anything, get your answer',
                 style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.wb_sunny_outlined),
                        const SizedBox(height: 6),
                        Text('Examples',
                        style: textTheme.titleMedium),
                        const SizedBox(height: 40),
                        const ExampleWidget(text: '“Explain quantum computing in simple terms”'),
                        const ExampleWidget(text: '“Got any creative ideas for a 10 year old’s birthday?”'),
                        const ExampleWidget(text: '“How do I make an HTTP request in Javascript?”'
                        ),
                      ],
                    ),
                  ),
                ),
                ] else 
                   Expanded(child: ChatListView(conversation: conversations)),
                    ChatTextField(
                        controller: controller,
                        onSubmitted: (question) {
                          controller.clear();
                          FocusScope.of(context).unfocus();
                          conversations.add(Conversation(question!, ""));
                          setState(() {});
                          post(Uri.parse("http://127.0.0.1:8000/get-response"),
                                  body: jsonEncode({"text": question}),
                                  headers: {"Content-Type": "application/json"})
                              .then((response) {
                            String result = jsonDecode(response.body)['response'];
                            conversations.last =
                                Conversation(conversations.last.question, result);
                            setState(() {});
                          });
                        }),
                  const SizedBox(height: 12),
              ]
            ),
          ),
        ),
      )
    );
  }
}