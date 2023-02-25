import 'package:firebase_card/databaseservices.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'person.dart';

// class edit extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return (MyState());
//   }
// }

// class MyState extends State<edit> {
//   mydb sb = mydb();
//   var mycontroller1 = TextEditingController();
//   var mycontroller2 = TextEditingController();
//   var mycontroller3 = TextEditingController();
//   var mycontroller4 = TextEditingController();
//   var mycontroller5 = TextEditingController();
//   var name = '';
//   var age = '';
//   var DoB = '';
//   var phoneNo = '';
//   var address = '';

//   @override
//   Widget build(BuildContext context) {
//     return (Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Data"),
//         centerTitle: true,

//       ),
//       body: Column(children: [
//         Padding(
//               padding: EdgeInsets.all(20),
//               child: Text(
//                 "Fill Form",
//                 style: TextStyle(fontSize: 20),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mycontroller1,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), labelText: "Enter Name"),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mycontroller2,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), labelText: "Enter Age"),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mycontroller3,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), labelText: "Enter DoB"),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mycontroller4,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), labelText: "Enter phoneNo"),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(10),
//               child: TextField(
//                 controller: mycontroller5,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), labelText: "Enter Address"),
//               ),
//             ),
//             Padding(
//                   padding: EdgeInsets.all(10),
//                   child: ElevatedButton(
//                       onPressed: () {
//                         var p = person(
//                             name: mycontroller1.text,
//                             age: int.parse(mycontroller2.text),
//                             DoB: mycontroller3.text,
//                             phoneNo: double.parse(mycontroller4.text),
//                             address: mycontroller5.text);
//                         sb.update(p);
//                         mycontroller1.clear();
//                         mycontroller2.clear();
//                         mycontroller3.clear();
//                         mycontroller4.clear();
//                         mycontroller5.clear();
//                         Fluttertoast.showToast(
//                             msg: "data updated successfully");
//                       },
//                       child: Text("Edit")),
//                 ),
//       ],)
//     ));
//   }
// }

class edit extends StatefulWidget {
  const edit({required this.personkey});

  final String personkey;
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<edit> {
  late DatabaseReference dbRef;
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  var mycontroller4 = TextEditingController();
  var mycontroller5 = TextEditingController();
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('person');
    getpersondata();
  }

  void getpersondata() async {
    DataSnapshot snapshot =
        (await dbRef.child(widget.personkey).get());
    Map person = snapshot.value as Map;

    mycontroller1.text = person['name'];
    mycontroller2.text = person['age'];
    mycontroller3.text = person['DoB'];
    mycontroller4.text = person['phoneNo'];
    mycontroller5.text = person['address'];
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("Edit Data"),
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
                    Map<String, String> persons = {
                      'name': mycontroller1.text,
                      'age': mycontroller2.text,
                      'DoB': mycontroller3.text,
                      'phoneNo': mycontroller4.text,
                      'address': mycontroller5.text,
                    };
                    dbRef
                        .child(widget.personkey)
                        .update(persons)
                        .then((value) => {
                          Navigator.pop(context)
                        });

                    mycontroller1.clear();
                    mycontroller2.clear();
                    mycontroller3.clear();
                    mycontroller4.clear();
                    mycontroller5.clear();
                    Fluttertoast.showToast(msg: "data updated successfully");
                  },
                  child: Text("Edit")),
            ),
          ],
        )));
  }
}
