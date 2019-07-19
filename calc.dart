import 'package:flutter/material.dart';
class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  buttonPressed(String buttonText){

  }
 Widget buildButton(String buttonText){
 return Expanded(child: OutlineButton(
   onPressed: () => {},
   color: Colors.blueGrey,
     padding: EdgeInsets.all(24.0),
 child: Text('buttonText', style: TextStyle(fontSize: 20)),

 )

 );
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(
            vertical: 24,
                horizontal: 12,
          ),
          child: Text('0', style: TextStyle(
              fontSize:40,color: Colors.blue,
          fontWeight: FontWeight.bold))
        ),



          ),
          Expanded(child: Divider()),

          Column(
            children: [
              Row(children:[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
                buildButton("*"),
            ]),
              Row(children:[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("/"),
              ]),
              Row(children:[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+"),
              ]),
              Row(children:[
                buildButton("0"),
                buildButton("-"),
                buildButton("."),

              ]),
  ])

    )],

    ));




}
}
