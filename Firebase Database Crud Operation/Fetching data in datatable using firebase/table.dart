import 'package:firebase_card/databaseservices.dart';
import 'package:firebase_card/person.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

import 'package:fluttertoast/fluttertoast.dart';

class table extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<table> {
  mydb sb = mydb();
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  var mycontroller4 = TextEditingController();
  var mycontroller5 = TextEditingController();
  var name = '';
  var age = '';
  var DoB = '';
  var phoneNo = '';
  var address = '';
  List<DataRow> rowss = [];
  getrows() async {
    DataSnapshot p = await sb.select("person");
    for (var i in p.children) {
      setState(() {
      name = i.child('name').value.toString();
      age = i.child('age').value.toString();
      DoB = i.child('DoB').value.toString();
      phoneNo = i.child('phoneNo').value.toString();
      address = i.child('address').value.toString();

      rowss.add(DataRow(cells: [
        DataCell(Container(
          child: Text(name),
          width: 60,
        )),
        DataCell(Container(
          child: Text(age),
          width: 30,
        )),
        DataCell(Container(
          child: Text(DoB),
          width: 90,
        )),
        DataCell(Container(
          child: Text(phoneNo),
          width: 60,
        )),
        DataCell(Container(
          child: Text(address),
          width: 60,
        ))
      ]));
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                getrows();
                rowss.clear();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: DataTable(
          columnSpacing: 20.0,
          columns: [
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Age")),
            DataColumn(label: Text("DoB")),
            DataColumn(label: Text("Phone")),
            DataColumn(label: Text("Address"))
          ],
          rows: rowss),
    ));
  }
}

