// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:calculator/Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'DEL',
    '='
  ];
  var operand = "";
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(children: [
        Expanded(
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    operand,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ])),
        ),
        Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                          tapped: () {
                            setState(() {
                              operand = "";
                              result = "";
                            });
                          },
                          text: buttons[index],
                          color: Colors.grey,
                          textcolor: Colors.white);
                    } else if (index == 1) {
                      return MyButton(
                          tapped: () {
                            setState(() {
                              var i = int.parse(operand);
                              operand = (-i).toString();
                            });
                          },
                          text: buttons[index],
                          color: Colors.grey,
                          textcolor: Colors.white);
                    } else if (index == 18) {
                      return MyButton(
                          tapped: () {
                            setState(() {
                              operand =
                                  operand.substring(0, operand.length - 1);
                            });
                          },
                          text: buttons[index],
                          color: Colors.redAccent,
                          textcolor: Colors.white);
                    } else if (index == 19) {
                      return MyButton(
                          tapped: () {
                            setState(() {
                              equalpressed();
                            });
                          },
                          text: buttons[index],
                          color: Colors.white,
                          textcolor: Colors.deepPurple);
                    }

                    return MyButton(
                        tapped: () {
                          setState(() {
                            operand += buttons[index];
                          });
                        },
                        text: buttons[index],
                        color: Colors.white,
                        textcolor: Colors.deepPurple);
                  }),
            ))
      ]),
    );
  }

  void equalpressed() {
    String ans = operand;
    ans = ans.replaceAll("X", "*");
    Parser p = Parser();
    Expression exp = p.parse(ans);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }
}
