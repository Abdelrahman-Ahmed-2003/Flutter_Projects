import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  String text = '0.0';
  String result = '';
  String opr = '';
  String num1 = '';
  String num2 = '';

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
  Widget build(BuildContext context) {
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
          Container(
            color: Colors.blueGrey,
            height: 100.0,
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: const TextStyle(fontSize: 35.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcbutton("AC", Colors.blueGrey[800]!),
              calcbutton("!", Colors.blueGrey[800]!),
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

  void calculation(String btnText) {
    if (btnText == "AC") {
      clearAll();
    } else if (btnText == "=") {
      evaluate();
    } else if (btnText == "Del") {
      delete();
    } else {
      if (!['+', '-', '*', '/', '%'].contains(btnText)) {
        if (btnText == '.') {
          if (opr.isEmpty && !num1.contains('.')) {
            appendText(btnText);
          } else if (opr.isNotEmpty && !num2.contains('.')) {
            appendText(btnText);
          }
        } else {
          appendText(btnText);
        }
      } else {
        opr = btnText;
        appendText(btnText);
      }
    }
  }

  void clearAll() {
    setState(() {
      text = '0.0';
      result = '';
      opr = '';
      num1 = '';
      num2 = '';
    });
  }

  void evaluate() {
    String expression = result;
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      text = eval.toString();
      result = eval.toString();
      opr = '';
      num1 = eval.toString();
      num2 = '';
    });
  }

  void delete() {
    setState(() {
      if (result.isNotEmpty) {
        result = result.substring(0, result.length - 1);
        text = result;
      }
    });
  }

  void appendText(String btnText) {
    bool endsWithOperator = result.isNotEmpty &&
        ['+', '-', '*', '/', '%'].contains(result[result.length - 1]);

    // Check if the current input is an operator and the previous character was also an operator
    if (['+', '-', '*', '/', '%'].contains(btnText) && endsWithOperator) {
      // If so, remove the last operator from the result
      setState(() {
        result = result.substring(0, result.length - 1);
      });
    }
    setState(() {
      result += btnText;
      text = result;
      if (opr.isEmpty) {
        num1 += btnText;
      } else {
        num2 += btnText;
      }
    });
  }
}
