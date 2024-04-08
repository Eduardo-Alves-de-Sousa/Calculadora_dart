import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button(text: 'AC', big: true),
            Button(text: '%'),
            Button(text: '/'),
          ]),
          ButtonRow([
            Button(text: '7'),
            Button(text: '8'),
            Button(text: '9'),
            Button(text: 'X'),
          ]),
          ButtonRow([
            Button(text: '4'),
            Button(text: '5'),
            Button(text: '6'),
            Button(text: '-'),
          ]),
          ButtonRow([
            Button(text: '1'),
            Button(text: '2'),
            Button(text: '3'),
            Button(text: '+'),
          ]),
          ButtonRow([
            Button(text: '0', big: true),
            Button(text: '.'),
            Button(text: '='),
          ]),
        ],
      ),
    );
  }
}