import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

// Widget que representa o teclado da calculadora
class Keyboard extends StatelessWidget {
  const Keyboard({Key? key, required this.cb});

  final void Function(String) cb; // Função de callback chamada ao pressionar um botão

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Altura fixa do teclado
      child: Column(
        children: <Widget>[
          // Primeira linha de botões
          ButtonRow([
            Button.big(text: 'AC', color: Button.DARK, cb: cb), // Botão grande para limpar (AC)
            Button(text: '%', color: Button.DARK, cb: cb),       // Botão para percentagem (%)
            Button.operation(text: '/', cb: cb),                 // Botão de divisão (/)
          ]),
          const SizedBox(height: 1), // Espaçamento entre as linhas de botões
          // Segunda linha de botões
          ButtonRow([
            Button(text: '7', cb: cb), // Botão numérico (7)
            Button(text: '8', cb: cb), // Botão numérico (8)
            Button(text: '9', cb: cb), // Botão numérico (9)
            Button.operation(text: 'x', cb: cb), // Botão de multiplicação (x)
          ]),
          const SizedBox(height: 1), // Espaçamento entre as linhas de botões
          // Terceira linha de botões
          ButtonRow([
            Button(text: '4', cb: cb), // Botão numérico (4)
            Button(text: '5', cb: cb), // Botão numérico (5)
            Button(text: '6', cb: cb), // Botão numérico (6)
            Button.operation(text: '-', cb: cb), // Botão de subtração (-)
          ]),
          const SizedBox(height: 1), // Espaçamento entre as linhas de botões
          // Quarta linha de botões
          ButtonRow([
            Button(text: '1', cb: cb), // Botão numérico (1)
            Button(text: '2', cb: cb), // Botão numérico (2)
            Button(text: '3', cb: cb), // Botão numérico (3)
            Button.operation(text: '+', cb: cb), // Botão de adição (+)
          ]),
          const SizedBox(height: 1), // Espaçamento entre as linhas de botões
          // Quinta linha de botões
          ButtonRow([
            Button.big(text: '0', cb: cb),       // Botão grande para zero (0)
            Button(text: '.', cb: cb),           // Botão para ponto decimal (.)
            Button.operation(text: '=', cb: cb), // Botão de igual (=) para calcular
          ]),
        ],
      ),
    );
  }
}