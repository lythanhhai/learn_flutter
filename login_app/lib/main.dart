import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginApp(),
  ));
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: new BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1675556610400-48b3c7f1c488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=438&q=80"),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: new Container(
              decoration: new BoxDecoration(color: Colors.white.withOpacity(0)),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Color.fromRGBO(54, 57, 65, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 12.0, // soften the shadow
                spreadRadius: 3.0, //extend the shadow
                offset: Offset(
                  3.0, // Move to right 5  horizontally
                  3.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          margin: const EdgeInsets.fromLTRB(60, 80, 60, 70),
          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
          // color: Color.fromRGBO(54, 57, 65, 1),
          child: Column(
            children: <Widget>[
              Text(
                "Sign In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(47, 49, 53, 1),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(200, 200, 200, 1), fontSize: 13)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(47, 49, 53, 1),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(200, 200, 200, 1), fontSize: 13)),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Forgot password?",
                      style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Login", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: BorderSide(color: Colors.red))
                    )),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(86, 88, 91, 1)),
                    // padding: MaterialStateProperty.all(EdgeInsets.all(50)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(120, 15, 120, 15)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 15))),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Create new account!",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.cyan,
                  ),
                  Icon(
                    FontAwesomeIcons.message,
                    color: Colors.green,
                  ),
                  Icon(
                    FontAwesomeIcons.twitter,
                    color: Colors.blue,
                  ),
                  Icon(
                    FontAwesomeIcons.youtube,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Click here",
                      style: TextStyle(color: Color.fromRGBO(142, 82, 82, 1))),
                  Text(" "),
                  Text("for instruction video",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

// child: Image.network(
//               "https://images.unsplash.com/photo-1675556610400-48b3c7f1c488?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=438&q=80"),
