import 'package:flutter/material.dart';
import 'package:calculator_flutter/butoms/math_opera_button.dart';
import 'package:calculator_flutter/butoms/numeric_operation_button.dart';
import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/butoms/specials_buttons.dart';


// Input and output controllers
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
    showInputCharacters.addListener(() {});
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
                  colors: [Color.fromRGBO(14, 14, 14, 1), Color.fromRGBO(59, 59, 59, 50), Color.fromRGBO(82, 82, 82, 100)],
                  stops: [0.5, 0.6, 0.9],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft)),
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
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
                      color: Color.fromARGB(255, 255, 255, 255),
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
                SpecialsButtons(operators: 'AC'),
                SpecialsButtons(operators: 'CE'),
                SpecialsButtons(operators: '%'),
                SpecialsButtons(operators: '/'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(simbolMath: '7'),
                NumericButton(simbolMath: '8'),
                NumericButton(simbolMath: '9'),
                SpecialsButtons(operators: '*'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(simbolMath: '4'),
                NumericButton(simbolMath: '5'),
                NumericButton(simbolMath: '6'),
                SpecialsButtons(operators: '-'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [               
                NumericButton(simbolMath: '1'),
                NumericButton(simbolMath: '2'),
                NumericButton(simbolMath: '3'),
                NumericButton(simbolMath: '+'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                //NumericButton(valueNumberBtn: '0'),
                BaseButton(keyCalculator: '0', onPress: () => showInputCharacters.text += '0'),
                BaseButton(keyCalculator: '00', onPress: () => showInputCharacters.text += '00'),
                SpecialsButtons(operators: ','),
                MathOperatorButton(operator: '=')
              ]),
            ],
          ),
        ));
  }
}
