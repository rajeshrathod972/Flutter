import 'package:flutter/material.dart';

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var username = "rajesh";
  var password = "Pass@123";
  var t = '';
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "login",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: c1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter UserName"),
                )),
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: c2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Password"),
                  obscureText: true,
                )),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (username == c1.text && password == c2.text) {
                        t = 'You are successfully login';
                      }
                      c1.clear();
                      c2.clear();
                    });
                  },
                  child: Text("Login")),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('$t'),
            )
          ],
        ),
      ),
    ));
  }
}
