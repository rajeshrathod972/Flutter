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
  bool? flag3 = false;
  bool? flag4 = false;
  String s = '';
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Check Button"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              ListTile(
                title: Text("c"),
                leading: Checkbox(
                    value: flag1,
                    onChanged: (value) {
                      setState(() {
                        flag1 = value;
                      });
                    }),
              ),
              ListTile(
                title: Text("c++"),
                leading: Checkbox(
                    value: flag2,
                    onChanged: (value) {
                      setState(() {
                        flag2 = value;
                      });
                    }),
              ),
              ListTile(
                title: Text("java"),
                leading: Checkbox(
                    value: flag3,
                    onChanged: (value) {
                      setState(() {
                        flag3 = value;
                      });
                    }),
              ),
              ListTile(
                title: Text("python"),
                leading: Checkbox(
                    value: flag4,
                    onChanged: (value) {
                      setState(() {
                        flag4 = value;
                      });
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      s = "";
                      if (flag1 == true) {
                        s = "c";
                      }
                      if (flag2 == true) {
                        s += " c++";
                      }
                      if (flag3 == true) {
                        s += " java";
                      }
                      if (flag4 == true) {
                        s += " python";
                      }
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
