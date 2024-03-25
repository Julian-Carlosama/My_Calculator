import 'package:calculator_flutter/controller/is_operator.dart';
import 'package:flutter/material.dart';
//import 'package:calculator_flutter/controller/math_operations_numb.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'base_button.dart';
import 'package:math_expressions/math_expressions.dart';

class MathOperatorButton extends StatelessWidget {
  MathOperatorButton({super.key, required this.operators, required this.icons});

  final String operators;
  final FaIcon icons;
  final TextEditingController dataObtained = showInputCharacters;
  final TextEditingController oper = getInputCh;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      keyCalculator: operators,
      textColor: const Color.fromARGB(156, 238, 238, 238),
      btnColor: const Color.fromARGB(218, 56, 10, 193),
      fontSize: 45,
      icon: icons,
      onPress: () {
        if (isOperator(operators)) {
          oper.text += operators;
          dataObtained.text = oper.text;
        }

        //Code that allow do calculate when User check the '=' button
        if (dataObtained.text.isNotEmpty && operators == '=') {
          String getExpress = dataObtained.text;
          bool endsWithPercentage = dataObtained.text.endsWith('%');
          bool endsOperator =
              isOperator(dataObtained.text[dataObtained.text.length - 1]);

          //Calculate if the math expression ends with'%' operator
          if (endsWithPercentage) {
            getExpress = getExpress.replaceAll('%', '');
            Parser pr = Parser();
            Expression getExpre = pr.parse(getExpress);
            ContextModel cm = ContextModel();
            String finalExpre =
                getExpre.evaluate(EvaluationType.REAL, cm).toString();
            double percentaje = (double.parse(finalExpre) / 100);

            //Check result ends with integer or double
            if (percentaje % 1 == 0) {
              opResult.text = percentaje.toInt().toString();
            } else {
              opResult.text = percentaje.toString();
            }
          }

          //Return empty value if the espression ends with a math operator exept the '%' opearor
          if (endsOperator) {
            opResult.text += '';
          } else {
            Parser parser = Parser();
            Expression result = parser.parse(getExpress);
            ContextModel cm = ContextModel();
            double finalResult = result.evaluate(EvaluationType.REAL, cm);

            //Check result ends with integer or double
            if (finalResult % 1 == 0) {
              opResult.text = finalResult.toInt().toString();
            } else {
              opResult.text = finalResult.toString();
            }
          }
        }
      },
    );
  }
}
