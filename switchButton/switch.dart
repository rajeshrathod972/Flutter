import 'package:flutter/material.dart';

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  bool flag1 = false;

  String s = '';
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Switch Button"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ListTile(
                  title: Text("Developer option"),
                  leading: Switch(
                      value: flag1,
                      onChanged: (value) {
                        setState(() {
                          flag1 = value;
                          if (flag1 == true) {
                            s = "you selected developer mode";
                          } else {
                            s = '';
                          }
                        });
                      })),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('$s'),
              )
            ],
          )),
    ));
  }
}
