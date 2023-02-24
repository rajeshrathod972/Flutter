import 'package:flutter/material.dart';

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                i = i + 1;
              });
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text("Floatting Button"),
            centerTitle: true,
          ),
          body: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('count us $i',style: TextStyle(fontSize: 25),)],
          )),
    ));
  }
}