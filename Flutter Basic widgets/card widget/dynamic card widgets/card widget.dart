import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

// login is valid or not

class second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class student {
  String name = '';
  String sub = '';
  String year = '';
  student({required this.name, required this.sub, required this.year});
}

class MyState extends State<second> {
  var name1 = '';
  var sub = '';
  var year = '';
  getstudent() {
    List<student> stud = [];
    student s1 = student(name: "rajesh", sub: "Java", year: "first");
    student s2 = student(name: "krishna", sub: "python", year: "second");
    student s3 = student(name: "gopal", sub: "c", year: "first");
    student s4 = student(name: "rahul", sub: "Java", year: "last");
    stud.add(s1);
    stud.add(s2);
    stud.add(s3);
    stud.add(s4);
    return stud;
  }

  getcards() {
    List<Card> cards = [];
    var t1 = getstudent();
    for (int i = 0; i < t1.length; i++) {
      name1 = t1[i].name;
      cards.add(Card(
        child: Column(
          children: [
            ListTile(
              title: Text("$name1"),
            ),
            ButtonBar(
              children: [
                ElevatedButton(onPressed: null, child: Text("Edit")),
                ElevatedButton(onPressed: null, child: Text("delete"))
              ],
            )
          ],
        ),
      ));
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("card widget"),
              centerTitle: true,
             
            ),
            body: Column(
              children: getcards(),
            ))));
  }
}
