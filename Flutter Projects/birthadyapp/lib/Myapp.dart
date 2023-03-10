import 'package:birthday/databaseservices.dart';
import 'package:birthday/person.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<Myapp> {
  jems db2 = jems();
  var name = '';
  var DoB = '';
  var contNo = '';
  @override
  void initState() {
    super.initState();
    db2.open();
  }

  int i = 0;
  List<Card> cards = [];
  getcards() async {
    var rows = await db2.selectall();
    setState(() {
      for (var i = 0; i < rows.length; i++) {
        var dl = rows[i];

        var id1 = dl['name'];
        var id2 = dl['contNo'];
        var id3 = dl['DoB'];
        cards.add(Card(
            color: Colors.amber,
            child: Column(children: [
              ListTile(
                leading: Icon(Icons.man),
                title: Text("$id1"),
              ),
              ListTile(
                title: Text("contNo:$id2" + "    " + "DOB:$id3"),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, '/edit');
                      }),
                      child: Text("Edit")),
                  ElevatedButton(
                      onPressed: (() {
                        Navigator.pushNamed(context, '/delete');
                      }),
                      child: Text("Delete"))
                ],
              )
            ])));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Birthday information"),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      getcards();
                      cards.clear();
                    },
                    icon: Icon(Icons.refresh)),
                IconButton(onPressed: null, icon: Icon(Icons.home))
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              child: Icon(Icons.add),
            ),
            body: SingleChildScrollView(child: Builder(builder: (context) {
              return (Column(children: cards));
            })))));
  }
}
