import 'dart:ffi';

import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget {
  NumericButton({super.key, required this.number});

  final String number;
  final TextEditingController numbers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: number,
      onPress: () {
        number;
        showCharacters.text =
            (double.parse(showCharacters.text + number).toString());
      },
    );
  }
}
