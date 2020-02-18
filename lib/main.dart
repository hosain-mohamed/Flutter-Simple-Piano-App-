import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSong(int songNumber) {
    final audio1 = AssetsAudioPlayer();
    audio1.open('assets/note$songNumber.wav');
    audio1.play();
  }

  Widget buildPianoButton(int songNumber, int colorDegree) {
    return Expanded(
      child: FlatButton(
        color: Colors.blue[colorDegree],
        onPressed: () {
          playSong(songNumber);
        },
      ),
    );
  }

  List<Widget> getListOfPianoButtons() {
    List<Widget> list = new List<Widget>();
    for (int i = 1; i < 8; i++) {
      list.add(buildPianoButton(i, i * 100));
    }
    return list ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getListOfPianoButtons(),
              ),
        ),
      ),
    );
  }
}
