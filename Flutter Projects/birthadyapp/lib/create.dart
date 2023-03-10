import 'package:birthday/databaseservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:birthday/person.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/rendering.dart';

class create extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<create> {
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  jems db2 = jems();
  var name = '';
  var DoB = '';
  var contNo = '';
  @override
  void initState() {
    super.initState();
    db2.open();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
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
                      labelText: "Enter The Name",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: mycontroller2,
                  decoration: InputDecoration(
                      labelText: "Enter contNo", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: mycontroller3,
                  decoration: InputDecoration(
                      labelText: "Enter DoB In DD/MM/YYYY",
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      // var m1 = await db2.selectall();

                      setState(() {
                        //for th inserting data
                        var s1 = person(
                            name: mycontroller1.text,
                            contNo: mycontroller2.text,
                            DoB: mycontroller3.text);
                        db2.insert(s1);
                        mycontroller1.text = name;
                        mycontroller2.text = contNo;
                        mycontroller3.text = DoB;
                        // Navigator.pushNamed(context, '/');
                        

                        //for getting data
                        // var t = m1[0];
                        // name = t['name'].toString();
                        // DoB = t['DoB'].toString();
                        // contNo = t['contNo'].toString();
                        

                        //detelet the data
                        // db2.delete(mycontroller1.text);

                        //update the data
                        // var p1 = person(
                        //     name: mycontroller1.text,
                        //     contNo: mycontroller2.text,
                        //     DoB: mycontroller3.text);
                        // db2.update(p1);
                      });
                    },
                  )),
              Text("Mr $name Your DOB=$DoB and ContactNo=$contNo")
            ],
          )),
    ));
  }
}
