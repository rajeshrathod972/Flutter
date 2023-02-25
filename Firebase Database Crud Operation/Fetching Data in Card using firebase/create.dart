import 'package:firebase_card/databaseservices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'person.dart';

class create extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<create> {
  // mydb sb = mydb();

  late DatabaseReference dbRef;
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  var mycontroller4 = TextEditingController();
  var mycontroller5 = TextEditingController();
  // var name = '';
  // var age = '';
  // var DoB = '';
  // var phoneNo = '';
  // var address = '';

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('person');
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
          centerTitle: true,
        ),
        body: Column(
          children: [
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
              child: TextField(
                controller: mycontroller2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Age"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter DoB"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter phoneNo"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Enter Address"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    // var p = person(
                    //     name: mycontroller1.text,
                    //     age: int.parse(mycontroller2.text),
                    //     DoB: mycontroller3.text,
                    //     phoneNo: double.parse(mycontroller4.text),
                    //     address: mycontroller5.text);
                    // sb.add(p);
                    // mycontroller1.clear();
                    // mycontroller2.clear();
                    // mycontroller3.clear();
                    // mycontroller4.clear();
                    // mycontroller5.clear();
                    Map<String, String> persons = {
                      'name': mycontroller1.text,
                      'age': mycontroller2.text,
                      'DoB': mycontroller3.text,
                      'phoneNo': mycontroller4.text,
                      'address': mycontroller5.text,
                    };
                    dbRef.push().set(persons);
                    Fluttertoast.showToast(msg: "data created successfully");
                    mycontroller1.text='';
                    mycontroller2.text='';
                    mycontroller3.text='';
                    mycontroller4.text='';
                    mycontroller5.text='';
                  },
                  child: Text("create")),
            ),
          ],
        )));
  }
}
