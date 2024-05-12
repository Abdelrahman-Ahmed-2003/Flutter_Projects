import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(String but, Color butcolor) {
    return IconButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.all(28.0),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(butcolor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      onPressed: () {
        calculation(but);
      },
      icon: Text(
        but,
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      iconSize: 20.0,
    );
    /*MaterialButton(
        shape: const CircleBorder(
            side: BorderSide(
          color: Colors.black,
          width: 0.0,
        )),
        onPressed: () {
          calculation(but);
        },
        color: butcolor,
        child: Text(but,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            )));*/
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
                  "$text",
                  style: const TextStyle(fontSize: 35.0),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton("AC", Colors.blueGrey[800]!),
                calcbutton("DEL", Colors.blueGrey[800]!),
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
                calcbutton("=", Colors.blueGrey[800]!),
              ],
            ),
          ],
        ));
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == '*') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '*' ||
        btnText == '/' ||
        btnText == '=' ||
        btnText == '%') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == '*') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      } else if (opr == '%') {
        finalResult = mod();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mod() {
    result = (numOne % numTwo).toString();
    numOne = double.parse(result);
    print(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
