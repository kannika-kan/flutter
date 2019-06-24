import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/infor.dart';
import 'package:myapp/search.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:myapp/menu.dart';

class Save extends StatefulWidget {
  // Show some different formats.
  final String pageText;
  Save(this.pageText);

  @override
  _Save createState() => _Save();
}
final _id = TextEditingController();
final _idIn = TextEditingController();
final _date = TextEditingController();
final user =[];
//final bID = _id.text;
class _Save extends State<Save> {

  String id;
  String name ;
  String unit ;
  String band;
  String serial ;
  String price ;
  String address ;
  String note;

  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Admin").child("books").child("cX6feTpTHQhwr6E5gZI3DMDWUBb2");
  void initState() {
    super.initState();
    // _user();
    //data();
  }
  _user()async{
    // print(widget.uid);
    await FirebaseDatabase.instance.reference().child("Admin").child("books").child("cX6feTpTHQhwr6E5gZI3DMDWUBb2").child(_id.text)
        .once().then((DataSnapshot snapshot) {
      var list = new Item.fromSnapshot(snapshot);
      setState(() {
        _date.text = list.date;
        id = list.id;
        name = list.name;
        unit = list.unit;
        band = list.band;
        serial = list.serial;
        price = list.price;
        address = list.address;
        note = list.note;
      });
    });
  }
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

                    SizedBox(height: 20.0,
                    ),
//                    Text('Search' ,
//                      style: TextStyle(
//                          fontSize: 30.0 ,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.lightBlue[200]),
//                    ),

                    TextFormField(
                      controller: _id,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 15.0),
                          prefixIcon: Icon(Icons.search),
                          labelText: 'Search',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),
                          filled: true,
                          fillColor: Colors.black38,
                          border: InputBorder.none
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RaisedButton(
                      color: Colors.pink[300],
                      child: Text('Next' ,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      onPressed: () {
                        _user();
                        if( id == ' ' ) {
                            showDialog(
                                context: context,
                                builder: (_) =>
                                new AlertDialog(
                                  title: new Text('แจ้งเตือน'),
                                  content: new Text('ไม่มีข้อมูลที่คุณค้นหา',
                                    style: new TextStyle(fontSize: 18.0),),
                                  actions: <Widget>[
                                    new FlatButton(onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                        child: new Text('ตกลง')),
                                  ],
                                )
                            );

                        }
                      },
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                    Show()
                  ],
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
  Widget Show(){
    return
      new Container(
          child:
          new Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text('The result of search ?', style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[200],)),
                SizedBox(
                  height: 10.0,
                ),
                Text('ID_sutcode : $id' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Name : $name', style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Date value:' + _date.text.toString().split(' ')[0],style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Unit : $unit' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Band_model : $band' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Serial_No : $serial' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Price : $price' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Address : $address' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                Text('Note : $note' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,)),
                SizedBox(
                  height: 10.0,
                ),
                BarCodeImage(
                  data: "$id",
                  codeType: BarCodeType.Code128,
                  lineWidth: 2.0,
                  barHeight: 90.0,
                  hasText: true,
                  onError: (error) {
                    print('error = $error');
                  },
                ),
                QrImage(
                  data: "$id",
                  size: 200.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(
                        builder: (context) => Menu()));
                  },
                  color: Colors.pink[300],
                  child: Text('ตกลง' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]
          )
      );

  }
}
