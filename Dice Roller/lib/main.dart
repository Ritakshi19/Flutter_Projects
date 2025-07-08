import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
          ),
          title: TextWidget('First App'),
          backgroundColor: Colors.purple,
        ),
        body: GradientContainer(),
        // backgroundColor: Color.fromARGB(206, 111, 161, 246),
        // body: Container(
        //   decoration: BoxDecoration(
        //     gradient: RadialGradient(
        //       colors: [
        //         Color.fromRGBO(1, 74, 219, 0.855),
        //         Color.fromRGBO(78, 135, 251, 0.855),
        //         Color.fromARGB(252, 254, 98, 251),
        //         Color.fromARGB(255, 255, 49, 183),
        //         Color.fromARGB(255, 246, 4, 198),

        //       ],
        //     ),
        //   ),
        //  child: Center(child: Text('Ritakshi Singh',style:TextStyle(fontSize: 45, color: Color.fromARGB(199, 255, 34, 34),fontWeight: FontWeight.bold)),
        //  ),
        // ),
      ),
    ),
  );
}


class GradientContainer extends StatelessWidget {
  String currImage="assets/dice-5.png";
  onDiceButtonClicked(){
    currImage="assets/dice-6.png";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 2, 27, 154),
            Color.fromARGB(255, 53, 149, 204),
            Color.fromARGB(252, 254, 98, 251),
            Color.fromARGB(255, 255, 49, 183),
            Color.fromARGB(255, 246, 4, 198),
          ],
        ),
      ),
      child: Center(
        child: DiceRoller()
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [ 
        //     TextWidget("DICE APP"),
        //     Image.asset(currImage,width: 200),
        //     ElevatedButton(onPressed: onDiceButtonClicked, child: Text("Roll Dice"))
        //   ],
        // ),
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  TextWidget(String content, {super.key}) {
    textContent = content;
  }
  String textContent = "";

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,

      style: TextStyle(
        fontSize: 45,
        color: Color.from(alpha: 1, red: 1, green: 1, blue: 1),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget{
  @override
  State<DiceRoller> createState() {
    return DiceRollerState();
  }  
}

class DiceRollerState extends State<DiceRoller>{
  String currImage="assets/dice-5.png";
  onDiceButtonClicked(){
    setState(() {
      int index=Random().nextInt(5)+1;
      currImage="assets/dice-" + '$index' +".png"; 
    });
    
  }
  @override
  Widget build(BuildContext context) {
  return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            TextWidget("DICE APP"),
            Image.asset(currImage,width: 200),
            ElevatedButton(onPressed: onDiceButtonClicked, child: Text("Roll Dice"))
          ],
        );
  }
}