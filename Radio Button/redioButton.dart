import 'package:flutter/material.dart';

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  bool? flag1 = false;
  bool? flag2 = false;
  String ?gv = 'male';
  String? s = '';
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Radio Button"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ListTile(
                  title: Text("Male"),
                  leading: Radio(
                    value: 'male',
                    groupValue: gv,
                    onChanged: (value) {
                      gv = value;
                    },
                  )),
              ListTile(
                  title: Text("female"),
                  leading: Radio(
                    value: 'female',
                    groupValue: gv,
                    onChanged: (value) {
                      gv = value;
                    },
                  )),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      s = gv;
                    });
                  },
                  child: Text("Ok")),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('you selected $s'),
              )
            ],
          )),
    ));
  }
}
