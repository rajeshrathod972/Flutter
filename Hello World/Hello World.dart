import 'package:flutter/material.dart';

class mywidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Hello woorld"),centerTitle: true,),
          body: Padding(padding: EdgeInsets.all(20),child: Text(
        "Hello world",style: TextStyle(fontSize: 40),
        
      ),)),
    ));
  }
}
