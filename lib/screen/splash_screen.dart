import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heigthScreen = MediaQuery.of(context).size.height;

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/CalculatorMain');
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: widthScreen,
          height: heigthScreen,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Color.fromRGBO(63, 24, 175, 38),
                Color(0xff3b3b3b),
                Color(0xff525252)
              ],
              stops: [0.25, 0.75, 0.88],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Icon_calc_512.png',
                  width: widthScreen * 0.2,
                  height: heigthScreen * 0.2,
                ),
                SizedBox(height: heigthScreen * 0.0001),
                Text(
                  'My calculator V 1.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthScreen * 0.03,
                    fontFamily: 'Orbitron',
                  ),
                )
              ],
            )),
      ),
    );
  }
}
