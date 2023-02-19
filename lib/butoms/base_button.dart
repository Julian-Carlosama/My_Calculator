import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {Key? key,
      this.btnColor = const Color.fromARGB(255, 67, 66, 67),
      this.keyCalculator = '',
      required this.onPress
    })
      : super(key: key);

  final Color btnColor;
  final String keyCalculator;
  final VoidCallback onPress;
  // Text controller
  //final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        // Code that creates the basics components of the Button
        child: ElevatedButton(
          onPressed: onPress , /*() => {
            // Add keyCalculator to text controller of textField
            controller.text += keyCalculator,
            enterData.text = controller.text
          },*/
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const CircleBorder(side: BorderSide.none)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(4)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 38)),
          ),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: Text(keyCalculator),
            ),
          ),
        )
      );
  }
}
