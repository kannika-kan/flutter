import 'package:flutter/material.dart';
import 'package:myapp/login_page.dart';


void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //resizeToavoidBottomPadding: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue[200]),
      title: 'Login',
      home: LoginPage(),
    );
  }
}
