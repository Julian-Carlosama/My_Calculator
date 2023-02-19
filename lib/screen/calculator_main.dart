import 'package:calculator_flutter/butoms/base_button.dart';
import 'package:calculator_flutter/butoms/numeric_button.dart';
import 'package:calculator_flutter/butoms/specials_buttons.dart';
import 'package:flutter/material.dart';

// Input and ouput variables
TextEditingController showCharacters = TextEditingController();
TextEditingController resultData = TextEditingController();

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
    showCharacters.addListener(() {});
    resultData.addListener(() {});
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
                  colors: [Colors.black, Colors.grey, Colors.white],
                  stops: [0.3, 0.6, 0.9],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft)),
          child: Column(
            children: [
              // This code show the operations in process
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintText: '0',
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
                  controller: showCharacters,
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                ),
              ),

              // This code show the process Result
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  enabled: false,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Result',
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
                  controller: resultData,
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              // This block of code  is the  numeric  and operator keyboard
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SpecialsButtons(operators: 'AC'),
                SpecialsButtons(operators: 'e'),
                SpecialsButtons(operators: '%'),
                SpecialsButtons(operators: '/'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BaseButton(keyCalculator: '7',onPress: () => showCharacters.text += '7'),
                BaseButton(keyCalculator: '8', onPress: () => showCharacters.text += '8'),
                BaseButton(keyCalculator: '9', onPress: () => showCharacters.text += '9'),
                SpecialsButtons(operators: '*'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BaseButton(keyCalculator: '4', onPress: () => showCharacters.text += '4'),
                BaseButton(keyCalculator: '5', onPress: () => showCharacters.text += '5'),
                BaseButton(keyCalculator: '6', onPress: () => showCharacters.text += '6'),
                SpecialsButtons(
                  operators: '-',
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BaseButton(keyCalculator: '1', onPress: () => showCharacters.text = (double.parse('${showCharacters.text}1')).toString()),
                BaseButton(keyCalculator: '2', onPress: () => showCharacters.text = (double.parse('${showCharacters.text}2')).toString()),
                BaseButton(keyCalculator: '3', onPress: () => showCharacters.text = (double.parse('${showCharacters.text}3')).toString()),
                SpecialsButtons(operators: '+'),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumericButton(number: '0'),
                //BaseButton(keyCalculator: '0',onPress: () => showCharacters.text += '0'),
                BaseButton(keyCalculator: '00', onPress: () => showCharacters.text += '00'),
                //SpecialsButtons(operators: ','),
                SpecialsButtons(operators: '.'),
                SpecialsButtons(operators: '='),
              ]),
            ],
          ),
        ));
  }
}
