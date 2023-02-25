import 'package:flutter/material.dart';

// login is valid or not

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("AppBar"),
              centerTitle: true,
              actions: [IconButton(onPressed: null, icon: Icon(Icons.home)),
              IconButton(onPressed: null, icon: Icon(Icons.refresh)),
              IconButton(onPressed: null, icon: Icon(Icons.backspace))],
            ),
            )));
  }
}
