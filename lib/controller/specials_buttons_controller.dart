import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';

void logicSpecialButton(String operator, TextEditingController dataObtained) {
  String getCharacters = dataObtained.text;
  int sizeString = getCharacters.length;
  int inicial = 0;
  String deleteLastCharact;

  if (operator == 'AC') {
    dataObtained.clear();
    opResult.clear();
  } else if (operator == 'CE') {
    if (sizeString - 1 >= 0) {
      deleteLastCharact = getCharacters.substring(inicial, sizeString - 1);
      dataObtained.text = deleteLastCharact;
    }
  }
  showInputCharacters.text = dataObtained.text;
}
