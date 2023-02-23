import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/screen/calculator_main.dart';
import 'package:flutter/material.dart';

class NumericButton extends StatelessWidget {
  NumericButton({
    super.key,
    required this.valueNumberBtn,// Parameter that allow storage the value number of the botton
    required this.presse, 
  });

  final String valueNumberBtn;

  // This variable gets user input from keyboard
  final TextEditingController getString = showInputCharacters;
  //final TextEditingController txtInput = TextEditingController();
  final VoidCallback presse;

  //List<int> number = [];

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      //keyCalculator: valueNumberBtn,
      onPress: () {
        presse;
        //valueNumberBtn;
        /*for (int i = 0; i < getString.text.length; i++) {
          if (int.tryParse(getString.text[i]) != null) {
            number.add(int.tryParse(getString.text[i])!);
          }
          showInputCharacters.text = number.toString();
        }*/
        showInputCharacters.text =
            (int.tryParse(showInputCharacters.text + valueNumberBtn)
                .toString());
        //txtInput.add(int.tryParse(valueNumberBtn));
      },
    );
  }
}
