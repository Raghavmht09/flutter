import 'package:flutter/material.dart';

import './screens/ServerCall.dart';

void main() {
  runApp(MaterialApp(
      title: 'MusicPlayer',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Music Player',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
          backgroundColor: Colors.white,
        ),
body:  Container(
  child: ServerCall(),
),
//        body: Container(
//          child: ServerCall(),
        ),
        /*  body: Container(
            //margin: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 100),
              padding: EdgeInsets.all(30),
              height: 300,
              width: 300,
              color: Colors.red,
              child: Text(
                  'Hello Container',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
//                 color: Colors.white),
                  )) */
      ));
  ;
}


