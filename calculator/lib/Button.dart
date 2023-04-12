// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String text;
  final tapped;
  const MyButton(
      {super.key, this.color, this.textcolor, required this.text, this.tapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: operator(text) ? Colors.deepPurple : color,
                child: Center(
                  child: Text(
                    text,
                    style: operator(text)
                        ? TextStyle(color: Colors.white, fontSize: 20)
                        : TextStyle(color: textcolor, fontSize: 20),
                  ),
                ))),
      ),
    );
  }

  bool operator(String x) {
    if (x == '/' || x == 'X' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }
}
