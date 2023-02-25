import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<MyApp> {
  // DatabaseReference ref = FirebaseDatabase.instance.ref();
  var name = '';
  var age = '';
  var phoneNo = '';
  var id = 0;
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  add() async {
    DatabaseReference db = FirebaseDatabase.instance.ref("student/{$name}");
    await db.set({"name": name, "age": age, "phoneNo": phoneNo});
    setState(() {});
  }

  select() async {
    DatabaseReference db = FirebaseDatabase.instance.ref();
    DataSnapshot snapshot = await db.child("student/{$name}").get();
    setState(() {
      mycontroller1.text = snapshot.child('name').value.toString();
      mycontroller2.text = snapshot.child('age').value.toString();
      mycontroller3.text = snapshot.child('phoneNo').value.toString();
    });
  }

  update() async {
    DatabaseReference db = FirebaseDatabase.instance.ref("student/{$name}");
    db.update({"age": age, "phoneNo": phoneNo});
  }

  delete() async {
    DatabaseReference db = FirebaseDatabase.instance.ref("student/{$name}");
    db.remove();
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("fill form"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller1,
                decoration: InputDecoration(
                    labelText: "Enter the name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller2,
                decoration: InputDecoration(
                    labelText: "Enter the age", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mycontroller3,
                decoration: InputDecoration(
                    labelText: "Enter the Phone No",
                    border: OutlineInputBorder()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        name = mycontroller1.text;
                        age = mycontroller2.text;
                        phoneNo = mycontroller3.text;
                        add();
                        // select();
                        mycontroller1.text = '';
                        mycontroller2.text = '';
                        mycontroller3.text = '';
                        Fluttertoast.showToast(
                            msg: "data inserted successfully");
                      },
                      child: Text("submit")),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        name = mycontroller1.text;
                        age = mycontroller2.text;
                        phoneNo = mycontroller3.text;
                        // add();
                        select();
                        // mycontroller1.text = '';
                        // mycontroller2.text = '';
                        // mycontroller3.text = '';
                        Fluttertoast.showToast(
                            msg: "data selected successfully");
                      },
                      child: Text("select")),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        name = mycontroller1.text;
                        age = mycontroller2.text;
                        phoneNo = mycontroller3.text;
                        update();

                        mycontroller1.text = '';
                        mycontroller2.text = '';
                        mycontroller3.text = '';
                        Fluttertoast.showToast(
                            msg: "data updated successfully");
                      },
                      child: Text("Update")),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        name = mycontroller1.text;
                        delete();

                        mycontroller1.text = '';
                        Fluttertoast.showToast(
                            msg: "data deleted successfully");
                      },
                      child: Text("delete")),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
