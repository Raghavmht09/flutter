import 'dart:convert';
import'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MySong {
  String artistName;
  String trackName;
  String previewUrl;

  MySong(this.trackName, this.artistName, this.previewUrl, songObj);
}

class ServerCall extends StatefulWidget {
  @override
  _ServerCallState createState() => _ServerCallState();
}

class _ServerCallState extends State<ServerCall> {
  List<MySong> songList = [];
  bool isPLay= false;

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
          songObj['trackName'], songObj['artistName'], songObj['previewUrl'], songObj['artworkUrl100']);
      songList2.add(song);
    }
    print("Now SongList is ");
    for (int i = 0; i < songList2.length; i++) {
      print("Song is ${songList2[i].trackName}");
    }
    setState(() {
      songList = songList2;
    });
  }
  _playSong(index) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(songList[index].previewUrl);


    /*` if(isPLay) {

    await audioPlayer.play( songList[index].previewUrl);
    isPLay=false;
  }
else(){
       audioPlayer.stop();
      isPLay=true;
    };*/

  }

  _stopSong( index) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.stop();
  }

  _pauseSong(index) async{
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.pause();

  }

    @override
  Widget build(BuildContext context) {
    callServer();
    return Container(
      child:
      ListView.builder(
                  itemCount: songList.length,
                  itemBuilder: (context, index) {

//                    return Card(
//                      color: Colors.grey,
//                      elevation: 50,
//                      clipBehavior: Clip.hardEdge,
                      child:return Row(
                        children: <Widget>[


                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar( maxRadius: 40,
                                child: Container(
                                  child: Image(image: songList[index].artworkUrl100),
                                ),
                              ),
                              title: Text(
                                songList[index].trackName,
                                style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(songList[index].artistName,style: TextStyle(fontStyle: FontStyle.italic))
                            ),
                            flex: 7,
                          ),



                                Expanded(
                                  child: IconButton(
                                  icon: Icon(Icons.play_arrow),
                                  padding: EdgeInsets.all(10.0),
                                  onPressed: () {
                                    _playSong(index);
                                  },

                              ),
                                  flex: 1,
                                ),

                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.stop),
                              padding: EdgeInsets.all(10.0),
                              onPressed: () {
                                _stopSong(index);
                              },

                            ),
                            flex: 1,
                          ),

                         Expanded(
                            child: IconButton(
                              icon: Icon(Icons.pause),
                              padding: EdgeInsets.all(10.0),
                              onPressed: () {
                                _pauseSong(index);
                              },

                            ),
                            flex: 1,
                          ),





                          ]
                         );




                  }),
            );







  }








}