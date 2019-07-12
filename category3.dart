import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/cart.dart';

class productsinCategory3 extends StatefulWidget {
  @override
//  final String appBarkey;
//  productsinCategory3({Key key, this.appBarkey}) : super(key: key);

  _productsinCategory3State createState() => _productsinCategory3State();
}

class _productsinCategory3State extends State<productsinCategory3> {



  Widget _buildList () {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Tshirt').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return new ListView(children: getProduct(snapshot));
      },
    );
  }
  getProduct(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.documents
        .map((doc) => new ListTile(
      leading: Icon(Icons.add_shopping_cart),
      title: new Text(doc["Name"]),
      subtitle: new Text("RS"+doc["Price"].toString()),
      trailing: MaterialButton(
          color: Colors.black,
          child: Text('Add To cart', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),



          onPressed: () {}


      ),
    )
    )
        .toList();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Tshirts'),
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));

            },
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),

          )


        ],


      ),

      body: _buildList(),





    );

  }

}
