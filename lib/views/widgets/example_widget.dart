import 'package:ai_chatapp/constants/colors.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  final String text;
  const ExampleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: CustomColors.darkGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Text(text,
        style: textTheme.bodyLarge,
        textAlign: TextAlign.center,
        ),
      )
    );
  }
}