

import 'package:ai_chatapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool fromAi;
  const MessageWidget({super.key, required this.text, this.fromAi = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: fromAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * .8
            ),
            decoration: BoxDecoration(
              color: fromAi ? CustomColors.lightGray : CustomColors.primary,
              borderRadius: BorderRadius.circular(8).copyWith(
                bottomLeft: fromAi ? const Radius.circular(0) : null,
                bottomRight: fromAi ? const Radius.circular(0) : null,
              )
            ),
            padding: const EdgeInsets.all(12),
            child: Text(text),
          ),
          if(fromAi)...[
            SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
            ),
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined, size: 22, color: Colors.grey),
              SizedBox(width: 10),
              Icon(Icons.thumb_down_alt_outlined, size: 22, color: Colors.grey),
              Spacer(),
              IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () {
                 _copyText(context, text); 
                },
                ),
              SizedBox(width: 2),
              Text('copy')
            ],
          )
          ]
        ],
      ),
    );
  }
}

void _copyText(BuildContext context, String textToCopy) {
  Clipboard.setData(ClipboardData(text: textToCopy));
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Text copied to clipboard')),
  );
}