import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  _playSong() async{
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play( "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview118/v4/94/25/9c/94259c23-84ee-129d-709c-577186cbe211/mzaf_5653537699505456197.plus.aac.p.m4a");
        }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children:[Card(
          child:Container(padding: EdgeInsets.fromLTRB(100, 10, 0, 300),
              child: RaisedButton(
            onPressed: () {
              _playSong();
            },
            child: Text('PLAY'),
          )),

        )],
    ));
  }
}
