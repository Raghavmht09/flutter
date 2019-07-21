import 'dart:convert';
import'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MySong {
  String artistName;
  String trackName;
  String previewUrl;
  MySong(this.trackName, this.artistName, this.previewUrl);
}

class ServerCall extends StatefulWidget {
  @override
  _ServerCallState createState() => _ServerCallState();
}

class _ServerCallState extends State<ServerCall> {
  List<MySong> songList = [];

  callServer() async {
    var result = await http
        .get('https://itunes.apple.com/search?term=jack+johnson&limit=25');
    var obj = json.decode(result.body);

    print("Obj is $obj");
    var arr = obj['results'];
    List<MySong> songList2 = [];
    for (int i = 0; i < arr.length; i++) {
      var songObj = arr[i];
      MySong song = new MySong(
          songObj['trackName'], songObj['artistName'], songObj['previewUrl']);
      songList2.add(song);
    }
    print("Now SOngList is ");
    for (int i = 0; i < songList2.length; i++) {
      print("Song is ${songList2[i].trackName}");
    }
    setState(() {
      songList = songList2;
    });
  }

  _playSong(index) async{
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play( songList[index].previewUrl);
  }

  @override
  Widget build(BuildContext context) {
    callServer();
    return Container(
              child: ListView.builder(
                  itemCount: songList.length,
                  itemBuilder: (context, index) {

                    return Card(
                      elevation: 20,
                       color: Colors.blue,


                       child: ListTile(
                          title: Text(
                            songList[index].trackName,
                            style: TextStyle(fontSize: 40,color: Colors.black),
                          ),
                       subtitle: Text(songList[index].artistName),


                       /*   trailing: Row(
                          children: <Widget>[

                          IconButton(
                            icon: Icon(Icons.play_arrow),
                    padding: EdgeInsets.all(10.0),
                    onPressed: () {
                    _playSong(index);
                    },

                    ),

                       IconButton(
                         icon:Icon(Icons.stop),
                         padding: EdgeInsets.all(10.0),
                         onPressed: (){

                         },
                       )   ],
                    ),*/

                        )



                      ],
                    );
                  })
          );




  }
}