import 'package:flutter/material.dart';

// Classe que representa um botão personalizado na calculadora
class Button extends StatelessWidget {
  // Construtor para um botão normal
  const Button({
    Key? key,
    required this.text,
    this.big = false,
    this.color = DEFAULT,
    required this.cb,
  });

  // Construtor nomeado para um botão grande
  const Button.big({
    Key? key,
    required this.text,
    this.big = true,
    this.color = DEFAULT,
    required this.cb,
  });

  // Construtor nomeado para um botão de operação
  const Button.operation({
    Key? key,
    required this.text,
    this.big = false,
    this.color = OPERATION,
    required this.cb,
  });

  // Cores estáticas utilizadas pelos botões
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;          // Texto exibido no botão
  final bool big;             // Indica se o botão é grande (do tamanho de dois botões normais)
  final Color color;          // Cor de fundo do botão
  final void Function(String) cb; // Callback chamado quando o botão é pressionado

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1, // Define o fator de expansão (flex) do botão
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Cor do texto do botão (branco)
          backgroundColor: color, // Cor de fundo do botão
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Borda retangular sem arredondamento
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,      // Cor do texto (branco)
            fontSize: 32,              // Tamanho da fonte
            fontWeight: FontWeight.w200, // Peso da fonte (200 é mais leve que o padrão)
          ),
        ),
        onPressed: () => cb(text), // Define o callback a ser chamado ao pressionar o botão
      ),
    );
  }
}