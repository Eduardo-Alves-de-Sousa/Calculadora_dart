import 'package:flutter/material.dart';
import 'button.dart';

// Classe que representa uma linha de botões personalizada
class ButtonRow extends StatelessWidget {
  const ButtonRow(this.buttons, {Key? key}) : super(key: key);

  final List<Button> buttons; // Lista de botões que compõem a linha

  @override
  Widget build(BuildContext context) {
    // Retorna um Expanded widget para ocupar todo o espaço disponível na linha
    return Expanded(
      flex: 1, // Define o flex para expandir de forma uniforme ao longo do eixo principal
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os widgets ao longo do eixo transversal
        children: buttons.fold(<Widget>[], (list, b) {
          // Utiliza o método fold para percorrer a lista de botões e construir a linha
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          // Adiciona um SizedBox com largura 1 entre os botões para criar um espaço mínimo
          return list; // Retorna a lista de widgets construída
        }),
      ),
    );
  }
}