import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/controller/is_number.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget {
  NumericButton({super.key, required this.numberValue});

  final String numberValue;
  final TextEditingController showCh = showInputCharacters;
  final TextEditingController getCh = getInputCh;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: numberValue,

      onPress: () {
        if (isNumber(numberValue)) {
          getCh.text += numberValue;
          showCh.text = getCh.text;
        } 
      },
    );
  }
}
