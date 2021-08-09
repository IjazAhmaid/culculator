import 'package:flutter/material.dart';
import 'dart:math';
import 'numberlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Cuculator App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Abc> abc1 = [
    Abc(
      name1: 'log',
    ),
    Abc(
      name1: '√',
    ),
    Abc(
      name1: 'x2',
    ),
    Abc(
      name1: 'π',
    ),
    Abc(
      name1: 'asin',
    ),
    Abc(
      name1: 'acos',
    ),
    Abc(
      name1: 'atan',
    ),
    Abc(
      name1: 'DEL',
    ),
    Abc(
      name1: 'Sin',
    ),
    Abc(
      name1: 'Cos',
    ),
    Abc(
      name1: 'Tan',
    ),
    Abc(
      name1: '^',
    ),
    Abc(
      name1: '1',
    ),
    Abc(
      name1: '2',
    ),
    Abc(
      name1: '3',
    ),
    Abc(
      name1: '/',
    ),
    Abc(
      name1: '4',
    ),
    Abc(
      name1: '5',
    ),
    Abc(
      name1: '6',
    ),
    Abc(
      name1: '*',
    ),
    Abc(
      name1: '7',
    ),
    Abc(
      name1: '8',
    ),
    Abc(
      name1: '9',
    ),
    Abc(
      name1: '-',
    ),
    Abc(
      name1: '.',
    ),
    Abc(
      name1: '0',
    ),
    Abc(
      name1: '=',
    ),
    Abc(
      name1: '+',
    ),
  ];
  String _out = '';
  double num1 = 0;
  double num2 = 0;
  String operand = '';
  String output = '0';

  // ignore: unused_element
  ijaz(String btnVal) {
    print(btnVal);
    if (btnVal == "DEL") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnVal == "π") {
      const double pi = 3.1415926535897932;
      _out = pi.toString();
    } else if (btnVal == "ln2") {
      const double ln2 = 0.6931471805599453;
      _out = ln2.toString();
    } else if (btnVal == "ln10") {
      const double ln10 = 2.302585092994046;
      _out = ln10.toString();
    } else if (btnVal == "e") {
      const double e = 2.718281828459045;
      _out = e.toString();
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/" ||
        btnVal == "Sin" ||
        btnVal == "Cos" ||
        btnVal == "Tan" ||
        btnVal == "√" ||
        btnVal == "asin" ||
        btnVal == "atan" ||
        btnVal == "log" ||
        btnVal == "^" ||
        btnVal == "acos" ||
        btnVal == "x2") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Already exist");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }

      if (operand == "Cos") {
        num1 = 0;
        _out = (cos(num2)).toString();
      }
      if (operand == "^") {
        _out = (pow(num1, num2)).toString();
      }
      if (operand == "Tan") {
        num1 = 0;
        _out = (tan(num2)).toString();
      }
      if (operand == "asin") {
        num1 = 0;
        _out = (asin(num2)).toString();
      }
      if (operand == "atan") {
        num1 = 0;
        _out = (atan(num2)).toString();
      }
      if (operand == "acos") {
        num1 = 0;
        _out = (acos(num2)).toString();
      }

      if (operand == "Sin") {
        num1 = 0;
        _out = (sin(num2)).toString();
      }
      if (operand == "log") {
        num1 = 0;
        _out = (log(num2)).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }

      if (operand == "*") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      if (operand == "√") {
        num1 = 0;
        _out = sqrt(num2).toString();
      }
      if (operand == "x2") {
        _out = (exp(num2)).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    } else {
      if (operand == "0") {
        operand = btnVal;
      } else {
        _out = _out + btnVal;
      }
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 20),
          /* Container(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
            alignment: Alignment.centerRight,
            child: Text(num1.toString() + operand + num2.toString()),
          ), */
          Container(
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
            alignment: Alignment.centerRight,
            child: Text(output),
          ),
          Divider(),
          SizedBox(height: 20),
          Expanded(
            child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(20.0),
                children: abc1.map((ab) {
                  return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            ijaz(ab.name1);
                          },

                          child: Text(
                            '${ab.name1}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          // ${ma.sAingsone1}
                        ),
                      ]);
                }).toList()),
          ),
          Divider(
            height: 40,
          ),
        ],
      ),
    );
  }
}
