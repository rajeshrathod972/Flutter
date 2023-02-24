import 'package:flutter/material.dart';

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  @override
  Widget build(BuildContext context) {
    double i = 1;

    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("sliding Bar"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Slider(
                    divisions: 10,
                    min: 1,
                    max: 100,
                    value: i,
                    onChanged: ( value) {
                      i = value ;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("selected value is $i"),
                )
              ],
            ))));
  }
}
