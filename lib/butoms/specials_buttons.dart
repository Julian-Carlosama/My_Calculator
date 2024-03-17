import 'package:flutter/material.dart';
import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/controller/specials_buttons_controller.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';

class SpecialsButtons extends StatelessWidget {
  SpecialsButtons({super.key, required this.operators});

  final String operators;

  // Controller that gets user input from keyboard.
  final TextEditingController dataObtained = showInputCharacters;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: operators,
      btnColor: const Color.fromRGBO(59, 59, 59, 100),
      textColor: const Color.fromARGB(255, 5, 253, 38),
      onPress: () => logicSpecialButton(operators, dataObtained),
    );
  }
}
