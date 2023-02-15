import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController extends ChangeNotifier {
  login(String username, String pass) {}

  void signup(String username, String pass) {
    http
        .post(
          Uri.parse('http://127.0.0.1:5001/crudbookflutter/us-central1/signup'),
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
        .then((value) =>

            // print(value.body["user"])
            {
              if (json.decode(value.body)['uid'] != null)
                {
                  http
                      .post(
                        Uri.parse(
                            'http://127.0.0.1:5001/crudbookflutter/us-central1/saveUserAfterLogin'),
                        headers: <String, String>{
                          "Access-Control-Allow-Origin": "*",
                          'Content-Type': 'application/json',
                          'Accept': '*/*',
                          'X-Requested-With': 'XMLHttpRequest',
                        },
                        body: jsonEncode(<String, dynamic>{
                          "id": json.decode(value.body)['uid'],
                          "email": json.decode(value.body)['email'],
                          "roles": "author",
                        }).toString(),
                      )
                      .then((value) => print(value.body))
                      .catchError((err) => print("Err after login: " + err))
                }
              else
                {print("User is existed!")}
            })
        .catchError((err) => print(err));
  }
}
