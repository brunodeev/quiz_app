import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  const Question(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Text(
        text,
        style: TextStyle(fontSize: 28, color: Colors.black.withOpacity(0.7)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
