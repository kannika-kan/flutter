import 'package:flutter/material.dart';
import 'package:myapp/search.dart';
import 'package:myapp/infor.dart';
import 'package:myapp/login_page.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),


      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Admin", style: TextStyle(fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
                accountEmail: new Text("admin@sut.com" , style: TextStyle(fontSize: 13.0,
                    fontWeight: FontWeight.bold)),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is the current user"),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/ddd.jpg')
                ),
              ),

              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/ccc.jpg'))
              ),
            ),
            new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () => Navigator.of(context).pop()
            ),
            new Divider(),
            new ListTile(
              title: new Text("Search"),
              trailing: new Icon(Icons.search),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Search("Search")));
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("New Information"),
              trailing: new Icon(Icons.create_new_folder),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Infor("new information")));
                }
            ),
            new Divider(),
            new ListTile(
                title: new Text("Log out"),
                trailing: new Icon(Icons.lock_outline),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>LoginPage()
                  ));
                }
            ),
            new Divider(),
          ],
        ),
      ),
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
            padding: const EdgeInsets.all(30.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  Image(
                      width: 150.0,
                      height: 180.0,
                      fit: BoxFit.fill,
                      image: AssetImage('images/ggg.jpg')
                  ),
                  SizedBox(height: 30.0,
                  ),
                  Text('Welcome to Equipment Application' ,
                    style: TextStyle(
                        fontSize: 30.0 ,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent[100]),
                  ),
                  SizedBox(height: 30.0,
                  ),
                  Text('อาคารสิรินธรวิศวพัฒน์ F11 ' ,
                    style: TextStyle(
                        fontSize: 15.0 ,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  Text(
                      '   Equipment Application คือ Application ที่ใช้ตรวจคุรุภัณฑ์ของ อาคารสิรินธรวิศวพัฒน์ หรือ F11 เพื่อความสะดวกสบายในการตรวจเช็คคุรุภัณฑ์และอุปกรณ์ต่างๆ และง่ายต่อการจัดเก็บข้อมูลและค้นหา การทำ Mobile Application จึงเป็นตัวเลือกที่ดีในการจัดทำ.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black38),
                  ),

                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
//                  Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                    ],
//                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
