import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:math_expressions/math_expressions.dart';

class SpecialsButtons extends StatelessWidget {
  SpecialsButtons({super.key, required this.operators});

  final String operators;
  final TextEditingController controller = showCharacters;
  // Text controller
  //final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: operators,
      btnColor: const Color.fromARGB(255, 255, 123, 0),
      onPress: (() {
        if (operators == 'AC') {
          controller.clear();
          resultData.clear();
        } else if (operators == '=') {
          Expression result = Parser().parse(controller.text);
          resultData.text = result.toString();
        } else {
          controller.text += operators;
        }
        showCharacters.text = controller.text;
      }),
    );
  }
}
