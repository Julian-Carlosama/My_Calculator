import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';
/*import 'package:calculator_flutter/screen/wiewCalculator.dart';*/

void main() => runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My calculator",
      //home: SimpleCalculator(
      home: CalculatorMain(
        title: 'My Calculator',
      ),
    );
  }
}
