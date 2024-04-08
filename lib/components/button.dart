import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, this.big = false});

  final String text;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        child: Text(text),
        onPressed: (){},
      ),
    );
  }
}