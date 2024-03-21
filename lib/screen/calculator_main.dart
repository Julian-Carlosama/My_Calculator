import 'package:calculator_flutter/controller/is_number.dart';
import 'package:flutter/material.dart';
import 'package:calculator_flutter/butoms/math_opera_button.dart';
import 'package:calculator_flutter/butoms/numeric_button.dart';
import 'package:calculator_flutter/butoms/specials_buttons.dart';

// Input and output controllers
TextEditingController getInputCh = TextEditingController();
TextEditingController showInputCharacters = TextEditingController();
TextEditingController opResult = TextEditingController();

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({super.key, required this.title});

  final String title;

  @override
  State<CalculatorMain> createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {
  // Method that waits for the data to process
  @override
  void initState() {
    super.initState();
    getInputCh.addListener(() {});
    showInputCharacters.addListener(() {
      String gText = showInputCharacters.text;

      // Check if the text is not empty
      if (gText.isNotEmpty) {
        if (gText[0] == '-') {
          showInputCharacters.text = gText;
        } else if (!isNumber(gText[0])) {
          // Check if the first element it's a number
          // Delete first text character
          showInputCharacters.text = gText.substring(1);
        }
      }
    });
    opResult.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator 2.0'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff0e0e0e), Color(0xff3b3b3b), Color(0xff525252)],
          stops: [0.25, 0.75, 0.88],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
      
            /*gradient: LinearGradient(
              colors: [
                Color.fromRGBO(14, 14, 14, 1),
                Color.fromRGBO(59, 59, 59, 50),
                Color.fromRGBO(82, 82, 82, 100)
              ],

              stops: [
                0.5,
                0.6,
                0.9
              ],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft)*/),
          child: Column(
            children: [
              // This code shows the charaters entered
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: '0', // Show the initial character
                    hintStyle: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Orbitron',
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Orbitron',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.right,
                  controller: showInputCharacters, //Shows the charaters entered
                  onTap: () => FocusScope.of(context)
                      .requestFocus(FocusNode()), //Hide virtual keyboard
                ),
              ),

              // This code shows the Result of the operations
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  enabled: false,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Result', // Shows the text 'Result' initial.
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontFamily: 'Orbitron',
                          color: Color.fromARGB(255, 255, 255, 255))),
                  textInputAction: TextInputAction.none,
                  //keyboardType: TextInputType.,
                  style: const TextStyle(
                      fontSize: 32,
                      fontFamily: 'Orbitron',
                      //color: Color.fromARGB(255, 255, 255, 255),
                      color: Color.fromRGBO(32, 235, 5, 0.855),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  controller: opResult, // Show the result
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              // This block of code  is the  numeric  and operator keyboard
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SpecialsButtons(spcOperator: 'AC'),
                SpecialsButtons(spcOperator: 'CE'),
                MathOperatorButton(operators: '%'),
                MathOperatorButton(operators: '/')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(numberValue: '7'),
                NumericButton(numberValue: '8'),
                NumericButton(numberValue: '9'),
                MathOperatorButton(operators: '*')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(numberValue: '4'),
                NumericButton(numberValue: '5'),
                NumericButton(numberValue: '6'),
                MathOperatorButton(operators: '-'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(numberValue: '1'),
                NumericButton(numberValue: '2'),
                NumericButton(numberValue: '3'),
                MathOperatorButton(operators: '+')
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(numberValue: '0'),
                NumericButton(numberValue: '00'),
                NumericButton(numberValue: ','),
                MathOperatorButton(operators: '=')
              ]),
            ],
          ),
        ));
  }
}
