import 'dart:js';

import 'package:flutter/material.dart';
import 'package:proje/UyeOl.dart';
import 'package:proje/sifremiUnuttum.dart';
import 'package:proje/anaSayfa.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => loginPage(),
      '/UyeOl': (context) => UyeOl(),
      '/sifremiUnuttum': (context) => sifremiUnuttum(),
      '/anaSayfa': (context) => anaSayfa(),
    },
  ));
}


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String userName;
  String password;

  final _degerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[100],

        body: Form(
          key: _degerKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
              decoration: InputDecoration(
                labelText: "Kullanıcı Adı",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                userName = value;
              },
             ),
             SizedBox(
               height: 20.0,
             ),
             TextFormField(
              decoration: InputDecoration(
                labelText: "Şifre",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
              onSaved: (value) {
                password = value;
              },
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  child: Text("Üye Ol"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/UyeOl');
                  },
                ),
                MaterialButton(
                  child: Text("Şifremi Unuttum"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sifremiUnuttum');
                  },
                ),
              ],
            ),
          RaisedButton(
            child: Text("Giriş"),
            onPressed: () {
              _degerKey.currentState.save();
              debugPrint("userName : $userName , password : $password ");
              if (userName == "demo" && password == "demo") {
                debugPrint("Giriş başarılı");
                Navigator.pushNamed(context, '/anaSayfa');
              } else {
                debugPrint("Kullanıcı Adı ya da şifre hatalı");
              }
            },
            )
           ],
          ),
         ),
        ),
      ),
    );
  }
}

