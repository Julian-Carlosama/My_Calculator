import 'dart:ffi';

import 'package:calculator_flutter/butoms/numeric_button.dart';
import 'package:flutter/material.dart';

import '../screen/calculator_main.dart';

class OperationsMaths extends StatelessWidget {
  OperationsMaths({super.key, required this.res});

  final String res;
  final TextEditingController getString = showInputCharacters;
  List<String> result = [];

  @override
  Widget build(BuildContext context) {
    return NumericButton(
      valueNumberBtn: res,
      presse: () {
        for (int i = 0; i < getString.text.length; i++) {
          if (int.tryParse(getString.text[i]) != null) {
            result.add(int.tryParse(getString.text[i]));
          }
          showInputCharacters.text = result.toString();
          /*if (getString.text[i] == '+') {
            result = getString.text[0] + getString.text[1];
          } else if (getString.text[i] == '-') {
            result = getString.text[0] - getString.text[1];
          } else if (getString.text[i] == '*') {
            result = getString.text[0] * getString.text[1]!;
          } else if (getString.text[i] == '/') {
            result = getString.text[0] / getString.text[1];
          }*/

        }
      },
    );
  }
}
