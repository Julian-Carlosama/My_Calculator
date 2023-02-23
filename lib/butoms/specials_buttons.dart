import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:math_expressions/math_expressions.dart';

class SpecialsButtons extends StatelessWidget {
  SpecialsButtons({super.key, required this.operators});

  final String operators;

  // Controller that gets user input from keyboard.
  final TextEditingController dataObtained = showInputCharacters;
  // Text controller
  //final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      //keyCalculator: operators,
      btnColor: const Color.fromARGB(255, 255, 123, 0),
      onPress: (() {
        if (operators == 'AC') {
          dataObtained.clear();
          opResult.clear();
        } else if (operators == '=') {
          Expression result = Parser().parse(dataObtained.text); 
          opResult.text = result.toString(); // Aquí hay que cambiar para qie el valor del resultado sea verdadero
        } else {
          dataObtained.text += operators;
        }
        showInputCharacters.text = dataObtained.text;
      }),
    );
  }
}
