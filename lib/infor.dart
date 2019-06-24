import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:myapp/main.dart';
class Infor extends StatefulWidget {
  // Show some different formats.
  final String pageText;
  Infor(this.pageText);

  @override
  _InforState createState() => _InforState();
}
final _uid = "cX6feTpTHQhwr6E5gZI3DMDWUBb2";
final _date = TextEditingController();

class _InforState extends State<Infor> {
  List<Item> items = List( );
  Item item;

//  List<Item> items = List( );
//  Item item;
  final DatabaseReference database = FirebaseDatabase.instance.reference().child("Admin").child("books").child("cX6feTpTHQhwr6E5gZI3DMDWUBb2");

  submit() async{
    print("id"+'$id');
    print("name"+name);
    print("date"+date.toString().split(' ')[0]);
    print("unit"+unit);
    print("band"+band);
    print("serial"+serial);
    print("price"+price);
    print("address"+address);
    print("note"+note);

        database.child('$id').set({'date': date.toString().split(' ')[0],'id':id ,'name':name ,'unit':unit ,
          'band':band ,'serial':serial ,'price':price ,'address':address ,'note':note});
  }
  void initState () {
    super.initState( );
    item = Item(
      _uid,
        _date.text,
        id,
        name,
        unit,
        band,
        serial,
        price,
        address,
        note
    );
  }
  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };
  InputType inputType = InputType.both;

  bool editable = true;

  DateTime date;
  String dati ;

  String id ;
  String _id ;
  String name;
  String _name;

  String unit ;
  String _unit ;

  String band ;
  String _band ;

  String serial ;
  String _serial ;

  String price ;
  String _price ;

  String address ;
  String _address ;

  String note ;
  String _note ;




  void _showAlert()async{
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text('บันทึก'),
          content: new Text('บันทึกข้อมูลเรียบร้อย',
            style: new TextStyle(fontSize: 18.0),),
          actions: <Widget>[
            new FlatButton(onPressed: ()
            {
              submit();
              Navigator.of(context).pop();
              },
                child: new Text('ตกลง')),
          ],
        )
    );
  }
  final int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("New Information"),),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/hhh.jpg'))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text('Information' ,
                      style: TextStyle(
                          fontSize: 40.0 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigoAccent[200]),
                    ),
                  SizedBox(height: 15.0,
                  ),
//                  TextFormField(
//                    decoration: InputDecoration(
//                        errorStyle: TextStyle(fontSize: 13.0),
//                        prefixIcon: Icon(Icons.playlist_add),
//                        labelText: 'count',
//                        labelStyle: TextStyle(
//                            color: Colors.white,
//                            fontSize: 15.0
//                        ),
//                        filled: true,
//                        fillColor: Colors.black38,
//                        border: InputBorder.none),
//                  ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: 'ID_sutcode',
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
                          _id = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.add),
                          labelText: 'Name',
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
                          _name = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    DateTimePickerFormField(
                      inputType: InputType.date,
                      format: formats[InputType.date],
                      editable: editable,
                      decoration: InputDecoration(
                        icon: Icon(Icons.date_range, color: Colors.deepPurple[200]),
                          labelText: 'Date', hasFloatingPlaceholder: false),
                      onChanged: (dt) => setState(() => date = dt),
                    ),
                    //Text('Date value: $date'),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.assignment),
                          labelText: 'Unit',
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
                          _unit = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.brightness_medium),
                          labelText: 'Band_Model',
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
                          _band = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.format_indent_increase),
                          labelText: 'Serial_No',
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
                          _serial = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.monetization_on),
                          labelText: 'Price',
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
                          _price = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.home),
                          labelText: 'Address',
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
                          _address = str;
                        });
                      },
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 13.0),
                          prefixIcon: Icon(Icons.home),
                          labelText: 'Note',
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
                          _note = str;
                        });
                      },
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
                        setState(() {
                          name = _name;
                          id = _id;
                          unit = _unit;
                          band = _band;
                          serial = _serial;
                          price = _price;
                          address = _address;
                          note = _note;
                          //dati = date as String;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Is that correct ?', style: new TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[200],)),
                    Text('ID_sutcode : $id' , style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Name : $name', style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('Date value:' + '$date'.toString().split(' ')[0],style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
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
                  color: Colors.pink[300],
                  child: Text('Save' ,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: (){_showAlert();},
                )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
class Item {
  String key;
  String date;
  String id;
  String name;
  String unit;
  String band;
  String serial;
  String price;
  String address;
  String note;

  Item(this.key,this.date,this.id, this.name,this.unit,this.band,this.serial, this.price,this.address,this.note);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        date = snapshot.value["date"],
        id = snapshot.value["id"],
        name = snapshot.value["name"],
        unit = snapshot.value["unit"],
        band = snapshot.value["band"],
        serial = snapshot.value["serial"],
        price = snapshot.value["price"],
        address = snapshot.value["address"],
        note = snapshot.value["note"];

  toJson() {
    return {
      "date": _date.text,
      "id": id,
      "name": name,
      "unit":unit,
      "band":band,
      "serial":serial,
      "price": price,
      "address":address,
      "note":note,
    };
  }
}
