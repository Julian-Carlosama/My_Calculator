import 'package:flutter/material.dart';
import 'package:calculator_flutter/controller/math_operations_numb.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'base_button.dart';


class MathOperatorButton extends StatelessWidget {
  MathOperatorButton({super.key, required this.operator});

  final String operator;
  final TextEditingController dataObtained = showInputCharacters;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: operator,
      textColor: const Color.fromARGB(255, 5, 253, 38),
      onPress: () => mathOpNumb(dataObtained),
    );
  }
}
