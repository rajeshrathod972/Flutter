import 'package:firebase_card/databaseservices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:fluttertoast/fluttertoast.dart';

class delete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<delete> {
  mydb sb = mydb();
  var mycontroller1 = TextEditingController();
  
  var name = '';
  
  
  

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Delete Data"),
        centerTitle: true,
       
      ),
      body: Column(children: [
        Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Fill Form",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Name"),
              ),
            ),
            Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        sb.delete(mycontroller1.text);
                        mycontroller1.clear();
                        Fluttertoast.showToast(
                            msg: "data deleted successfully");
                        // sb.add(p);
                      },
                      child: Text("Delete")),
                ),
      ],)
    ));
  }
}
