import 'package:flutter/material.dart';
import 'package:myapp/menu.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController ctrlUsername = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              key:  _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45.0,
                    ),
                    Text('SUT' ,
                      style: TextStyle(
                          fontSize: 100.0 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue[200]),
                    ),

                    SizedBox(height: 60.0,
                    ),
                    Text('Welcome to Application' ,
                      style: TextStyle(
                          fontSize: 30.0 ,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[200]),
                    ),
                    SizedBox(height: 25.0,
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) return 'กรุณาระบุชื่อผู้ใช้งาน' ;
                      },
                      controller: ctrlUsername,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 15.0),
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Username',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),
                          filled: true,
                          fillColor: Colors.black38,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      validator: (String value) {
                        if (value.isEmpty) return 'กรุณาระบุรหัสผ่าน' ;
                      },
                      controller: ctrlPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(fontSize: 15.0),
                        prefixIcon: Icon(Icons.vpn_key),
                        labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0
                          ),
                          filled: true,
                          fillColor: Colors.black38,
                          border: InputBorder.none),
                    ),
                    SizedBox(height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                        onPressed: () => doLogin(),
                        color: Colors.pink[100],
                        child: Text('Login' ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                        // RaisedButton(
                        //   onPressed: () {},
                        //   color: Colors.green,
                        //   child: Text('New Register' ,
                        //     style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 18.0,
                        //         fontWeight: FontWeight.bold
                        //     ),
                        //   ),
                        // ),
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

  doLogin() {

    if(_formkey.currentState.validate()) {
      String username = ctrlUsername.text;
      String password = ctrlPassword.text;

      print(username);
      print(password);

      if(username == 'admin' && password == 'admin'){
        Navigator.pushReplacement(
            context, MaterialPageRoute(
            builder: (context) => Menu()));
      } else {
        print('Invalid username/password!');
      }
    }
  }
}
