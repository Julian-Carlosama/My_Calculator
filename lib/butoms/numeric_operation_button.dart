import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/controller/numeric_button_controller.dart';
//import 'package:calculator_flutter/controller/math_operations_numb.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget {
  NumericButton({super.key, required this.simbolMath});

  final String simbolMath;
  final TextEditingController getStringInputed = showInputCharacters;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
        keyCalculator: simbolMath,
        onPress: () {
          String validateNUmber = numericButon(simbolMath);

          if (validateNUmber.isNotEmpty) {
            getStringInputed.text += validateNUmber;
          }
        });
  }
}
