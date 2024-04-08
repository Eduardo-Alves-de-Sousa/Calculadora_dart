import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, this.big = false, this.color = DEFALT, required this.cb});
  const Button.big({super.key, required this.text, this.big = true, this.color = DEFALT, required this.cb});
  const Button.operation({super.key, required this.text, this.big = false, this.color = OPERATION, required this.cb});

  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFALT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  final void Function(String) cb;
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Define a cor do texto do botão
          backgroundColor: color, // Define a cor do texto do botão
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200
          ),
        ),
        onPressed: () => cb(text),
      ),
    );
  }
}