import 'package:flutter/material.dart';

class container1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Hello woorld"),
            centerTitle: true,
          ),
          body: Container(alignment: Alignment.center,
            color: Colors.amber,
            height: 200,
            child: Text(
              "Hello world",
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
          )),
    ));
  }
}
