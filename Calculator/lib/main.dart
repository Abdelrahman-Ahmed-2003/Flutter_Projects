import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext conresult) {
    return const MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
    
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late TextEditingController _controller = TextEditingController(text: '');
  bool start = true;

  Widget calcbutton(String but, Color butcolor) {
    return MaterialButton(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(28.0),
      onPressed: () {
        calculation(but);
      },
      color: butcolor,
      child: Text(
        but,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext conresult) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        leading: const Icon(Icons.calculate),
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.green[200],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              showCursor: true,
              readOnly: true,
              controller: _controller,
              style: const TextStyle(fontSize: 35.0, color: Colors.white),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("AC", Colors.blueGrey[800]!),
              calcbutton("()", Colors.blueGrey[800]!),
              calcbutton("%", Colors.blueGrey[800]!),
              calcbutton("/", Colors.blueGrey[800]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("7", Colors.blue),
              calcbutton("8", Colors.blue),
              calcbutton("9", Colors.blue),
              calcbutton("*", Colors.blueGrey[800]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("4", Colors.blue),
              calcbutton("5", Colors.blue),
              calcbutton("6", Colors.blue),
              calcbutton("-", Colors.blueGrey[800]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("1", Colors.blue),
              calcbutton("2", Colors.blue),
              calcbutton("3", Colors.blue),
              calcbutton("+", Colors.blueGrey[800]!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("0", Colors.blue),
              calcbutton(".", Colors.blue),
              calcbutton("Del", Colors.blue),
              calcbutton("=", Colors.blueGrey[800]!),
            ],
          ),
        ],
      ),
    );
  }

  void calculation(String btn) {
    if (btn == "AC") {
      clearAll();
    } else if (btn == "=") {
      evaluate();
    } else if (btn == "Del") {
      delete();
    } else {
      int cursorPosition = _controller.selection.baseOffset - 1;
      if(cursorPosition < 0) start = true;
      if (btn == '.') {
        late String temp = '';
        for (int i = cursorPosition; i >= 0; i--) {
          if (i < _controller.text.length &&
              !['+', '*', '/', '-', '%'].contains(_controller.text[i])) {
            temp += _controller.text[i];
          } else
            break;
        }
        print(temp);
        if (checkDP(temp)) {
          return;
        } else {
          appendresult(btn);
        }
      } else
        appendresult(btn);
    }
  }

  void clearAll() {
    setState(() {
      _controller.text = '';
    });
  }

  void evaluate() {
    try {
      String expression = _controller.text;
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        _controller.text = eval.toString();
      });
    } catch (e) {}
  }

  void delete() {
    setState(() {
      if (_controller.text.isNotEmpty && _controller.selection.baseOffset > 0) {
        int cursorPosition = _controller.selection.baseOffset;
        String newText = _controller.text
            .replaceRange(cursorPosition - 1, cursorPosition, '');
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: cursorPosition - 1),
        );
      }
    });
  }

  void appendresult(String btnresult) {
    int cursorPosition = _controller.selection.baseOffset;
    bool check = false;
    if (!start) {
      check = ['+', '*', '/', '-', '%']
          .contains(_controller.text[_controller.selection.baseOffset - 1]);
    } else if (['*', '/', '%', '+', '-'].contains(btnresult)) {
      return;
    }
    bool endsWithOperator = _controller.text.isNotEmpty && check;

    if (cursorPosition > 0 &&
        ['+', '*', '/', '%', '-'].contains(btnresult) &&
        endsWithOperator) {
      setState(() {
        _controller.text = _controller.text
            .replaceRange(cursorPosition - 1, cursorPosition, btnresult);
        _controller.selection = TextSelection.collapsed(offset: cursorPosition);
      });
    } else {
      start = false;
      String newText = _controller.text.substring(0, cursorPosition) +
          btnresult +
          _controller.text.substring(cursorPosition, _controller.text.length);

      _controller.value = _controller.value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPosition + 1),
      );
    }
  }

  bool checkDP(String text) {
    if (text.contains('.')) {
      return true;
    } else {
      return false;
    }
  }
}
