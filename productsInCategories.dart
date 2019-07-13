import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/JsonData.dart';
import '../widgets/cart.dart';

class productsinCategory extends StatefulWidget {
  @override
  final String appBarkey;
  productsinCategory({Key key, this.appBarkey}) : super(key: key);

  _productsinCategoryState createState() => _productsinCategoryState();
}

class _productsinCategoryState extends State<productsinCategory> {
  List<JsonData> fakelist = [  JsonData("http://www.karenmillen.com/on/demandware.static/-/Sites-KARENMILLEN/default/dwdccbbec4/images/hi-res/karen-millen_01636821_2.jpg",1000,10,"Brown Coat",01),
  JsonData("https://www.karenmillen.com/on/demandware.static/-/Sites-KARENMILLEN/default/dw44164614/images/hi-res/karen-millen_01656306_3.jpg",1500,5,"Blue Coat",02)
  ];

  _addRecordInDb(BuildContext context, int index ) async {
    Map<String, Object> map = <String, Object>{
      'id': fakelist[index].id,
      'Name': fakelist[index].Name,
      'Price': fakelist[index].Price,
      'Url': fakelist[index].Url,
       'Quantity': fakelist[index].Quantity,
    };
    final DocumentReference documentReference =
    Firestore.instance.document("products/"+fakelist[index].id.toString() );
    documentReference.setData(map).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  Widget _buildList(){
    return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: fakelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              child: Card(
                elevation: 7,
                child: Column(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 110,
                          child: Image.network(
                            fakelist[index].Url,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.fromLTRB(17, 10, 70, 10),
                          child: Text(fakelist[index].Name,style: TextStyle(fontStyle: FontStyle.normal,fontSize: 20),),
                        ),
                        Container(
                          child: Text(fakelist[index].Price.toString(),style: TextStyle(fontSize: 20)),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(child:
                        MaterialButton(
                          onPressed: ()
                          {
                            _addRecordInDb( context ,index);
                          },
                          child:  Text("Add To Cart",style: TextStyle( fontSize: 20)),


                        ),
                          flex: 1,

                        ),
                        Expanded(child:
                        MaterialButton(
                          onPressed: ()
                          {

                          },
                          child:  Text("Buy Now",style: TextStyle( fontSize: 20)),
                        ),
                          flex: 1,
                        ),
                      ],
                    )
                  ],
                ),
              )
          );
        }
    );
  }









  /*Widget _buildList () {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Coat').snapshots(),
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
  }*/







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Shop App-2019'),
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
