import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:auto_size_text/auto_size_text.dart'; // Importa o componente AutoSizeText
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

// Widget que representa o display da calculadora
class Display extends StatelessWidget {
  // Construtor da classe Display
  const Display({Key? key, required this.text});

  final String text; // Texto a ser exibido no display

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color.fromRGBO(48, 48, 48, 1), // Cor de fundo do display
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Alinha o conteúdo ao final (na parte inferior)
          crossAxisAlignment: CrossAxisAlignment.stretch, // Estica o conteúdo ao longo da largura
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                minFontSize: 20,      // Tamanho mínimo da fonte (para adaptação automática)
                maxFontSize: 80,      // Tamanho máximo da fonte (para adaptação automática)
                maxLines: 1,          // Número máximo de linhas (1 para texto em uma única linha)
                textAlign: TextAlign.end, // Alinhamento do texto à direita
                style: const TextStyle(
                  fontWeight: FontWeight.w100, // Peso da fonte (mais leve)
                  decoration: TextDecoration.none, // Nenhuma decoração de texto (como sublinhado)
                  fontSize: 80,         // Tamanho da fonte padrão
                  color: Colors.white,  // Cor do texto (branco)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}