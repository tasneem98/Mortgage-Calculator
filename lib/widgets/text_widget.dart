import 'package:flutter/material.dart';

import '/main.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.title, required this.value});

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: title,
        style: kBold24,
        children: [TextSpan(text: '\$${intl.format(value)}', style: kBold28)],
      ),
    );
  }
}

// Text Styles
TextStyle kBold24 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.deepPurple.shade900,
);
TextStyle kBold28 = const TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
