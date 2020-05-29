import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey('note1.wav', Colors.red, 'Dó'),
              buildKey('note2.wav', Colors.orange, 'Ré'),
              buildKey('note3.wav', Colors.yellow, 'Mi'),
              buildKey('note4.wav', Colors.blue, 'Fá'),
              buildKey('note5.wav', Colors.teal, 'Sol'),
              buildKey('note6.wav', Colors.green, 'Lá'),
              buildKey('note7.wav', Colors.purple, 'Si'),
            ],
          ),
        ),
      ),
    );
  }
}

Expanded buildKey(String note, MaterialColor backgroundColor, String noteName) {
  return Expanded(
    child: FlatButton(
      child: Text(
        noteName,
        style: TextStyle(fontSize: 18.0, color: Colors.white,),
      ),
      onPressed: () {
        playSound(note);
      },
      color: backgroundColor,
    ),
  );
}

playSound(String note) {
  final player = AudioCache();
  player.play(note);
}
