import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:myapp/infor.dart';
import 'package:myapp/search.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:myapp/menu.dart';


class scan extends StatefulWidget {

  final String pageText;
  scan(this.pageText);

  @override
  _scanState createState() => _scanState();
}
final d = TextEditingController();
final _id = TextEditingController();
final _idIn = TextEditingController();
final _date = TextEditingController();
final user =[];

class _scanState extends State<scan> {

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
    await FirebaseDatabase.instance.reference().child("Admin").child("books").child("cX6feTpTHQhwr6E5gZI3DMDWUBb2").child(id)
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


  _user2(String searchId)async{
    // print(widget.uid);
    await FirebaseDatabase.instance.reference().child("Admin").child("books").child("cX6feTpTHQhwr6E5gZI3DMDWUBb2").child(searchId)
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

  String d = "Scan!";

  Future _scanQR() async{
    try{
      String qrResult = await BarcodeScanner.scan();
      _user2(qrResult);
      setState(() {
        d = qrResult;
      });
    }on PlatformException catch (ex) {
      if(ex.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          d = "Camera permission was denied";
        });
      }else{
        setState(() {
          d = "Unknow Error $ex";
        });
      }
    }on FormatException{
      setState(() {
        d = "You pressed the back button before scanning anything";
      });
    }catch (ex) {
      setState(() {
        d = "Unknow Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Scanner"),),
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
                    TextField(
                      decoration: InputDecoration(
                          enabled : false,
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.home),
                          labelText: d,
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0
                          ),
                          filled: true,
                          fillColor: Colors.black38,
                          border: InputBorder.none
                      ),
                      onChanged: (str) {
                        setState(() {
                          _user();
                          if( _id != _id){
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
                        });
                      },
                    ),


                    SizedBox(
                      height: 20.0,
                    ),
                    Text('The result of search ?', style: new TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[200],)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('ID_sutcode : $id' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Name : $name', style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Date value:' + _date.text.toString().split(' ')[0],style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Unit : $unit' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Band_model : $band' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Serial_No : $serial' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Price : $price' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Address : $address' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Note : $note' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
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
                    SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),

              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
        backgroundColor: Colors.pink[100],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}

