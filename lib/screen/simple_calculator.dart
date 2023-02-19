import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:math_expressions/math_expressions.dart';

//String strInput = "";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  @override
  void initState() {
    super.initState();
    txtEntrada.addListener(() {});
    txtResultado.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // This is the total, the output.
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                  hintText: "0",
                  hintStyle: TextStyle(
                    fontSize: 40,
                    fontFamily: 'RobotoMono',
                    color: Color.fromARGB(255, 163, 253, 8)
                  )
                ),
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: 'RobotoMono',
                ),
                textAlign: TextAlign.right,
                controller: txtEntrada,
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()
              ),
            )
          ),

          // This is title Result
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: const InputDecoration.collapsed(
                    hintText: "Result",
                    fillColor: Colors.deepPurpleAccent,
                    hintStyle: TextStyle(
                        fontFamily: 'RobotoMono',
                        color: Color.fromARGB(255, 163, 253, 8))),
                textInputAction: TextInputAction.none,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    fontSize: 42,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold
                    // color: Colors.deepPurpleAccent
                    ),
                textAlign: TextAlign.right,
                controller: txtResultado,
              )),
          const SizedBox(height: 20.0),

          // This is the numeric keyboard, operators and actions

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              btnAC('AC', const Color(0xFFF5F7F9)),
              btnBorrar(),
              boton(
                '%',
                const Color(0xFFF5F7F9),
              ),
              boton(
                '/',
                const Color(0xFFF5F7F9),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text('1', style: TextStyle(color: Color.fromARGB(255, 209, 231, 121)),
              ),
              const Text('2', style: TextStyle(color: Color.fromARGB(255, 209, 231, 121)),
              ),
              const Text('3', style: TextStyle(color: Color.fromARGB(255, 209, 231, 121)),
              ),
              boton('7', Color.fromARGB(255, 136, 22, 22)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boton('7', const Color.fromARGB(255, 136, 22, 22)),
              boton('8', Colors.white),
              boton('9', Colors.white),
              boton('*', const Color(0xFFF5F7F9))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boton('7', Colors.white),
              boton('8', Colors.white),
              boton('9', Colors.white),
              boton('*', const Color(0xFFF5F7F9))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boton('4', Colors.white),
              boton('5', Colors.white),
              boton('6', Colors.white),
              boton('-', const Color(0xFFF5F7F9)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boton('1', Colors.white),
              boton('2', Colors.white),
              boton('3', Colors.white),
              boton('+', const Color(0xFFF5F7F9)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              boton('0', Colors.white),
              boton('.', Colors.white),
              btnIgual(),
            ],
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }

  Widget boton(String btntxt, Color btnColor) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        child: Text(
          btntxt,
          style: const TextStyle(
            fontSize: 28.0,
            color: Color.fromARGB(255, 11, 17, 189),
            fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = txtEntrada.text + btntxt;
          });
        },
        color: btnColor,
        padding: const EdgeInsets.all(18.0),
        splashColor: const Color.fromARGB(255, 181, 12, 200),
        shape: const CircleBorder(),
      ),
    );
  }

  Widget btnAC(btntext, Color btnColor) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        child: Text(
          btntext,
          style: const TextStyle(
              fontSize: 28.0, color: Colors.red, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = "";
            txtResultado.text = "";
          });
        },
        color: btnColor,
        padding: const EdgeInsets.all(18.0),
        splashColor: Colors.red,
        shape: const CircleBorder(),
      ),
    );
  }

  Widget btnBorrar() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        child: const Text('++'),
        /*child: Icon(Icons.backspace, size: 35, color: Colors.blueGrey),*/
        onPressed: () {
          txtEntrada.text = (txtEntrada.text.isNotEmpty)
              ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
              : "";
        },
        color: const Color(0xFFF5F7F9),
        padding: const EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: const CircleBorder(),
      ),
    );
  }

  Widget btnIgual() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        child: const Text(
          '=',
          style: TextStyle(
              fontSize: 28.0, color: Colors.black, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          Parser p = Parser();
          ContextModel cm = ContextModel();
          Expression exp = p.parse(txtEntrada.text);
          setState(() {
            txtResultado.text =
                exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        },
        color: Colors.cyan,
        padding: const EdgeInsets.all(18.0),
        splashColor: Colors.black,
        shape: const CircleBorder(),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  TextButton(
    {
      required Text child,
      required Null Function() onPressed,
      required Color color,
      required EdgeInsets padding,
      required Color splashColor,
      required CircleBorder shape
    }
  ) {}
}
