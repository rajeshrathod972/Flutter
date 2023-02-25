import 'package:flutter/material.dart';
import 'package:github/second%20page.dart';

// login is valid or not

class mywidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget1> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Routing using Navigator pushed"),
              centerTitle: true,
            ),
            body: Builder(builder: (context){
              return(
                Column(
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => second()));
                      },
                      child: Text("click to go next page")),
                )
              ],
            )
              );
            }))));
  }
}
