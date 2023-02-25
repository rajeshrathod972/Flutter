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
              title: Text("Drawer Widget"),
              centerTitle: true,
              
            ),drawer: Drawer(child: ListView(children: [
              DrawerHeader(child: Text("Drawer items"),decoration: BoxDecoration(color: Colors.red),)
              ,
              ListTile(title: Text("login"),),
              ListTile(title: Text("logout"),),
              ListTile(title: Text("Home"),)
            ],)),
            )));
  }
}
