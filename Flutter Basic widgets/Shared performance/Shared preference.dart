import 'package:flutter/material.dart';
import 'package:github/second%20page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// login is valid or not

class mywidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget1> {
  setState1() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    ref.setString('1', 'rajesh');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState1();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("sharedperformance"),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return (Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hello this is first page",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/second");
                    },
                    child: Text("click to go next page")),
              )
            ],
          ));
        })));
  }
}
