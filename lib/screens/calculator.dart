import 'package:flutter/material.dart';
import '../components/display.dart';
import '../components/keyboard.dart';
import '../models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory memory = Memory();

  void _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
          children: <Widget>[
            Expanded(
              child: Display(
                text: memory.value,
              ),
            ),
            Keyboard(cb: _onPressed),
          ],      
      ),
    );
  }
}
