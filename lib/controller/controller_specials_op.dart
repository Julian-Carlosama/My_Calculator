import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:flutter/material.dart';

class ControllerSpecialsOp extends StatelessWidget {
  ControllerSpecialsOp({super.key});

  // Text controller
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: () {
        /*controller.text += '';
        enterData.text = controller.text;*/
      },
      //number: '',
    );
  }
}
