import 'package:birthday/person.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'databaseservices.dart';

class delete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<delete> {
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  jems db2 = jems();
  // var name = '';
  // var DoB = '';
  // var contNo = '';
  @override
  void initState() {
    super.initState();
    db2.open();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("Birthday information"),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Fill Detail",
                style: TextStyle(fontSize: 25, color: Colors.red),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller1,
                decoration: InputDecoration(
                    labelText: "Enter The Name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      db2.delete(mycontroller1.text);
                      Fluttertoast.showToast(
                          msg: "Data deleted Successfully go back and refersh page");
                    });
                  },
                ))
          ],
        )));
  }
}
