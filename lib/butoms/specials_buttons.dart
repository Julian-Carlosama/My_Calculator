import 'package:flutter/material.dart';
import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/controller/specials_buttons_controller.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';

class SpecialsButtons extends StatelessWidget {
  SpecialsButtons({super.key, required this.spcOperator});

  final String spcOperator;

  // Controller that gets user input from keyboard.
  final TextEditingController dataObtained = getInputCh;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: spcOperator,
      //btnColor: const Color.fromRGBO(59, 59, 59, 100),
      btnColor: const Color.fromRGBO(63, 24, 175, 38), 
      //textColor: const Color.fromARGB(255, 5, 253, 38),
      textColor: const Color.fromARGB(156, 238, 238, 238),
      fontSize: 32,
      onPress: () => logicSpecialButton(spcOperator, dataObtained),
    );
  }
}
