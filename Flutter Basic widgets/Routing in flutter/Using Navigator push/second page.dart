import 'package:flutter/material.dart';
import 'package:github/Navigator%20Routes.dart';

// login is valid or not

class second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<second> {
  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
            appBar: AppBar(
              title: Text("Routing using Navigator pushed"),
              centerTitle: true,
            ),
            body: Builder(builder: (context){
              return(Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hello this is second page",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => mywidget1()));
                      },
                      child: Text("click to come privious page")),
                )
              ],
            ));
            })
            ));
  }
}