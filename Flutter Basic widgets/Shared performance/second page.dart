import 'package:flutter/material.dart';
import 'package:github/Shared%20preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

// login is valid or not

class second extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<second> {
  String fname = '';
  getvalue() async {
    SharedPreferences ref = await SharedPreferences.getInstance();
    
    setState(() {
      fname = ref.getString('1')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("second page"),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          return (Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Hello this is second page",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/first');
                    },
                    child: Text("click to come privious page and value is $fname")),
              )
            ],
          ));
        })));
  }
}
