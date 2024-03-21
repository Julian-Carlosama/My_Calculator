import 'package:calculator_flutter/controller/is_operator.dart';
import 'package:flutter/material.dart';
//import 'package:calculator_flutter/controller/math_operations_numb.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'base_button.dart';
import 'package:math_expressions/math_expressions.dart';

class MathOperatorButton extends StatelessWidget {
  MathOperatorButton({super.key, required this.operators});

  final String operators;
  final TextEditingController dataObtained = showInputCharacters;
  final TextEditingController oper = getInputCh;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: operators,
      //textColor: const Color.fromARGB(255, 5, 253, 38),
      textColor: const Color.fromARGB(156, 238, 238, 238),
      //btnColor: const Color.fromRGBO(63, 24, 175, 38),
      btnColor: const Color.fromARGB(218, 56, 10, 193),
      fontSize: 45,
      //onPress: () => mathOpNumb(dataObtained),
      onPress: () {
        if (isOperator(operators)) {
          oper.text += operators;
          dataObtained.text = oper.text;
        }
        if (dataObtained.text.isNotEmpty && operators == '=') {
          //Code that allow do calculate when User check the '=' button
          bool endsOperator = isOperator(dataObtained.text[dataObtained.text.length - 1]);
          bool endsWithPercentage = dataObtained.text.endsWith('%');

          if (endsWithPercentage) {
            Parser parser = Parser();
            Expression result = parser.parse(dataObtained.text);
            ContextModel cm = ContextModel();
            opResult.text = result.evaluate(EvaluationType.REAL, cm).toString();
          }
          
          if (endsOperator) {
            opResult.text += '';
          } else {
            Parser parser = Parser();
            Expression result = parser.parse(dataObtained.text);
            ContextModel cm = ContextModel();
            opResult.text = result.evaluate(EvaluationType.REAL, cm).toString();
          }
        }
      },
    );
  }
}
