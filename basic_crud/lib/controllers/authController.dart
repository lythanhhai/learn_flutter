import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController extends ChangeNotifier {
  login(String username, String pass) async {
    // http.post(
    //   Uri.parse('http://127.0.0.1:5002/crudbookflutter/us-central1/login'),
    //   headers: <String, String>{
    //     "Access-Control-Allow-Origin": "*",
    //     'Content-Type': 'application/json',
    //     'Accept': '*/*',
    //     'X-Requested-With': 'XMLHttpRequest',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'username': username,
    //     'password': pass,
    //   }),
    // );
    try {
      // print(username + " " + pass);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: pass,
      );
      // final FirebaseAuth auth = FirebaseAuth.instance;
      // final User? user = auth.currentUser;
      // final uid = user?.uid;
      // print(uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print("err: " + e.code.toString() + e.message.toString());
      }
    }
  }

  Future<String?> signup(String username, String pass, String roles) {
    String result = "";
    return http
        .post(
      Uri.parse('http://127.0.0.1:5002/crudbookflutter/us-central1/signup'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': pass,
      }),
    )
        .then((value) {
      if (json.decode(value.body)['uid'] != null) {
        http
            .post(
          Uri.parse(
              'http://127.0.0.1:5002/crudbookflutter/us-central1/saveUserAfterLogin'),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'X-Requested-With': 'XMLHttpRequest',
          },
          body: jsonEncode(<String, dynamic>{
            "id": json.decode(value.body)['uid'],
            "email": json.decode(value.body)['email'],
            "roles": roles,
          }).toString(),
        )
            .then((value) {
          // print(value.body);
          result = value.body;
          login(username, pass);
          return result;
        }).catchError((err) {
          print("Err after login: " + err.toString());
          return "Err after login: " + err;
        });
      } else {
        result = "User is existed!";
        return result;
      }
    }).catchError((err) {
      print("Err signup: " + err.toString());
      return "Err when signup!";
    });
  }
}
