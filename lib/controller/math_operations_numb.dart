import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';

void mathOpNumb(TextEditingController dataObtained) {
  RegExp simbolMaths = RegExp(r'[+\-*\/]');
  if (simbolMaths.hasMatch(dataObtained.text)) {
    String matchedSymbol = simbolMaths.firstMatch(dataObtained.text)!.group(0)!;
    dataObtained.text += matchedSymbol;
  }

  //Code that allow do calculate when User check the '=' button
  Parser parser = Parser();
  Expression result = parser.parse(dataObtained.text);
  ContextModel cm = ContextModel();
  opResult.text = result.evaluate(EvaluationType.REAL, cm).toString();
}
