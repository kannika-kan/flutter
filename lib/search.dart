import 'package:flutter/material.dart';
import 'package:myapp/scan.dart';
import 'package:myapp/save.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/infor.dart';
class Search extends StatefulWidget {
  // Show some different formats.
  final String pageText;
  Search(this.pageText);
  @override
  _Search createState() => _Search();
}
final _date = TextEditingController();

class _Search extends State<Search> {

  String id = '';
  String name = '';
  String unit = '';
  String band = '';
  String serial = '';
  String price = '';
  String address = '';
  String note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(title: new Text("Search"),),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/hhh.jpg')
                )
            ),
          ),
          Padding(
    padding: const EdgeInsets.all(30.0),
    child: Form(
    child: SingleChildScrollView(
    child: Column(
    children: <Widget>[

                    SizedBox(height: 25.0,
                    ),
                    Text('กรุณาเลือกการค้นหา' ,
                      style: TextStyle(
                          fontSize: 30.0 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[200]),
                    ),
                    SizedBox(height: 30.0,
                    ),
//                    TextFormField(
//                      decoration: InputDecoration(
//                          errorStyle: TextStyle(fontSize: 15.0),
//                          prefixIcon: Icon(Icons.search),
//                          labelText: 'Search',
//                          labelStyle: TextStyle(
//                              color: Colors.white,
//                              fontSize: 15.0
//                          ),
//                          filled: true,
//                          fillColor: Colors.black38,
//                          border: InputBorder.none),
//                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        Image(
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.fill,
                            image: AssetImage('images/search.jpg')
                        ),
                        SizedBox(height: 20.0,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>Save("")
                            ));
                          },
                          color: Colors.deepPurple[200],
                          child: Text('Search' ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,
                        ),
                        Image(
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.fill,
                            image: AssetImage('images/qr.jpg')
                        ),
                        SizedBox(height: 20.0,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>scan("")
                            ));
                          },
                          color: Colors.pink[100],
                          child: Text('Scan' ,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

