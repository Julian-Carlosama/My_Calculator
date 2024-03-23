import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {Key? key,
      //this.btnColor = const Color.fromRGBO(37, 37, 37, 10),
      this.btnColor = const Color.fromRGBO(117, 0, 233, 38),
      this.textColor = Colors.white,
      this.fontSize = 35,
      this.keyCalculator = '',
      this.icon,
      required this.onPress})
      : super(key: key);

  final Color btnColor;
  final Color textColor;
  final double fontSize;
  final String? keyCalculator;
  final FaIcon? icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;

    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
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
            width: widthScreen * 0.18,
            height: heightScreen * 0.1,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                if (icon != null) icon!,
                if (icon == null && keyCalculator != null)
                  Text(keyCalculator!,
                      style: TextStyle(color: textColor, fontSize: fontSize))
              ]),
            ),
          ),
        ));
  }
}
