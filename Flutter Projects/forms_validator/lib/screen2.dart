import 'package:demo/Character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'database.dart';

class myscreen2 extends StatefulWidget {
  _myscreen2 createState() => _myscreen2();
}

class _myscreen2 extends State<myscreen2> {
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var p = '';
  double m = 20;
  var q = "submit";
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: c1,
                decoration: InputDecoration(
                    labelText: "Enter Username", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                controller: c2,
                decoration: InputDecoration(
                    fillColor: Colors.red,
                    labelText: "Enter Password",
                    border: OutlineInputBorder()),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: m, left: m),
              child: ElevatedButton(
                  onPressed: () {
                    if (c1.text == "rajesh" && c2.text == "raj123") {
                      setState(() {
                        q = "submit";
                        p = "you are sucessfully login";
                        m = 20;
                        c = Colors.white;
                      });
                    } else {
                      setState(() {
                        m = m + 10;
                        p = "invalid";
                        c = Colors.red;
                        q = "invalid";
                      });
                    }
                  },
                  child: Text(
                    q,
                    style: TextStyle(color: c),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(p),
            )
          ],
        ));
  }
}
