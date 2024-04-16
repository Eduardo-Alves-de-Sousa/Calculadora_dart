import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/display.dart';
import '../components/keyboard.dart';
import '../models/memory.dart';

// Classe principal que representa a calculadora como um StatefulWidget
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

// Estado da calculadora, que controla o estado interno e a interface
class _CalculatorState extends State<Calculator> {
  // Instância da classe Memory para gerenciar o estado da calculadora
  final Memory memory = Memory();

  // Método chamado quando um botão da calculadora é pressionado
  void _onPressed(String command) {
    // Atualiza o estado da calculadora ao aplicar um comando
    setState(() {
      memory.applyCommand(command); // Aplica o comando à memória da calculadora
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define a orientação preferida da tela para retrato (vertical)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    // Retorna o widget principal da aplicação
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove o banner de debug no canto superior direito
      home: Column(
        children: <Widget>[
          Expanded(
            child: Display(
              text: memory.value, // Exibe o valor atual da calculadora no Display
            ),
          ),
          Keyboard(cb: _onPressed), // Renderiza o teclado da calculadora e define o callback onPressed
        ],
      ),
    );
  }
}