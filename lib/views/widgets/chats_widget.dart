import 'package:ai_chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onSubmitted;
  const ChatTextField({super.key, 
  required this.controller, 
  required this.onSubmitted
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.lightGray,
        borderRadius:BorderRadius.circular(8),
        border: Border.all(color: Colors.white)
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Flexible(child: 
          TextField(
            controller: controller,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
              onPressed: () {
                onSubmitted(controller.text);
              }, 
              style: IconButton.styleFrom(
                backgroundColor: CustomColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                )
              ),
              icon: Icon(
                Icons.send_outlined
                ),
              ),
          )
        ],
      ),
    );
  }
}