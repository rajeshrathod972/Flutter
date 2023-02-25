

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google/DatabaseServices.dart';
import 'package:google/student.dart';
import 'package:sqflite/sqflite.dart';

class myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (mystate());
  }
}

class mystate extends State<myapp> {
  mydb db = mydb();
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  var name = '';
  var password = '';
  var username = '';
  void initState() {
    super.initState();
    db.open();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(
              "Sqlite CRUD",
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "create account",
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: mycontroller1,
                  decoration: InputDecoration(
                      labelText: "Enter Name", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: mycontroller2,
                  decoration: InputDecoration(
                      labelText: "Enter UserName",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: mycontroller3,
                  decoration: InputDecoration(
                      labelText: "Enter Password",
                      border: OutlineInputBorder()),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          var s1 = student(
                              name: mycontroller1.text,
                              username: mycontroller2.text,
                              password: mycontroller3.text);
                          db.insert(s1);
                          mycontroller1.clear();
                          mycontroller2.clear();
                          mycontroller3.clear();
                        });
                      }),
                      child: Text(
                        "submit",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          var s1 = student(
                              name: mycontroller1.text,
                              username: mycontroller2.text,
                              password: mycontroller3.text);
                          db.update(s1);
                          mycontroller1.clear();
                          mycontroller2.clear();
                          mycontroller3.clear();
                          Fluttertoast.showToast(
                              msg: "your account updated successfully");
                        });
                      }),
                      child: Text(
                        "Update",
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      )),
                  ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          var s1 = db.delete(mycontroller1.text);
                          mycontroller1.clear();
                          Fluttertoast.showToast(
                              msg: "your account deleted successfully");
                        });
                      }),
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      )),
                  ElevatedButton(
                    onPressed: (() async {
                      var v1 = await db.select(mycontroller1.text);
                      setState(() {
                        var m = v1[0];
                        var id1 = m['name'];
                        var id2 = m['username'];
                        var id3 = m['password'];
                        name = id1.toString();
                        username = id2.toString();
                        password = id3.toString();
                        mycontroller2.text = username;
                        mycontroller3.text = password;
                      });
                    }),
                    child: Text("select",
                        style: TextStyle(fontSize: 20, color: Colors.green)),
                  )
                ],
              ),
              // Text(
              //     "this all data of $name and his pass $password and username is $username")
            ],
          )),
    ));
  }
}
