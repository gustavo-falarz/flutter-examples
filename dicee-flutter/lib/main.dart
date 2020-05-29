import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var lDiceNumber = 1;
  var rDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                updateDice();
              },
              child: Image.asset('images/dice$lDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                updateDice();
              },
              child: Image.asset('images/dice$rDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }

  void updateDice() {
    setState(() {
      lDiceNumber = Random().nextInt(6) + 1;
      rDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
