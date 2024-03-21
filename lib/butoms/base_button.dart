import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {Key? key,
      //this.btnColor = const Color.fromRGBO(37, 37, 37, 10),
      this.btnColor = const Color.fromRGBO(117, 0, 233, 38),
      this.textColor = Colors.white,
      this.fontSize = 35,
      this.keyCalculator = '',
      required this.onPress})
      : super(key: key);

  final Color btnColor;
  final Color textColor;
  final double fontSize;
  final String keyCalculator;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        // Code that creates the basics components of the Button
        child: ElevatedButton(
          onPressed: onPress,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(btnColor),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const CircleBorder(side: BorderSide.none)),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(4)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(fontSize: fontSize, color: textColor)),
          ),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Center(
              child: Text(keyCalculator, // This allow request a text
                  style: TextStyle(color: textColor, fontSize: fontSize)),
            ),
          ),
        ));
  }
}
