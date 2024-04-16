class Memory {
  // Define uma lista constante de operações suportadas
  static const operations = ['%', '/', 'x', '-', '+', '='];

  // Lista privada para armazenar os operandos
  final _buffer = [0.0, 0.0];  // Armazena dois operandos para cálculos
  int _bufferIndex = 0;        // Indica qual posição do buffer está sendo usada
  String? _operation;          // Armazena a operação atual (+, -, *, /, %)
  String _value = '0';         // Valor atual exibido na calculadora
  bool _wipeValue = false;     // Indica se o valor deve ser apagado na próxima entrada
  String? _lastCommand;        // Registra o último comando executado

  // Método para aplicar um comando à calculadora
  void applyCommand(String command) {
    // Verifica se o comando está substituindo a operação atual
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    // Determina a ação com base no comando recebido
    if (command == 'AC') {
      _allClear();              // Limpa a memória e reseta o estado da calculadora
    } else if (operations.contains(command)) {
      _setOperation(command);   // Define a operação (+, -, *, /, %, =)
    } else {
      _addDigit(command);       // Adiciona um dígito (0-9) ou ponto decimal ao valor atual
    }

    _lastCommand = command;     // Registra o último comando executado
  }

  // Método privado para verificar se uma nova operação deve substituir a atual
  bool _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  // Método privado para lidar com a definição da operação atual
  void _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;      // Prepara para apagar o valor para inserir o segundo operando
      }
    } else {
      // Realiza o cálculo quando ambos os operandos estão disponíveis
      _buffer[0] = _calculate(); // Executa a operação com os dois operandos
      _buffer[1] = 0.0;           // Reseta o segundo operando
      _value = _buffer[0].toString(); // Atualiza o valor exibido com o resultado
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value; // Remove decimais desnecessários

      _operation = isEqualSign ? null : newOperation; // Limpa a operação se for um sinal de igual
      _bufferIndex = isEqualSign ? 0 : 1; // Reinicia o índice do buffer se a operação for um sinal de igual
    }

    _wipeValue = true; // Define para apagar o valor na próxima entrada
  }

  // Método privado para adicionar um dígito ao valor atual
  void _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return; // Evita adicionar mais de um ponto decimal
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0; // Atualiza o operando correspondente
  }

  // Método privado para limpar todos os dados e reiniciar o estado
  void _allClear() {
    _value = '0';                    // Reseta o valor exibido para zero
    _buffer.setAll(0, [0.0, 0.0]);   // Limpa os operandos no buffer
    _bufferIndex = 0;                // Reinicia o índice do buffer
    _operation = null;               // Limpa a operação atual
    _wipeValue = false;              // Desativa a flag de apagar o valor
  }

  // Método privado para realizar o cálculo com base na operação atual
  double _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0]; // Retorna o primeiro operando se a operação for inválida
    }
  }

  // Método getter para obter o valor atual exibido na calculadora
  String get value {
    return _value;
  }
}
