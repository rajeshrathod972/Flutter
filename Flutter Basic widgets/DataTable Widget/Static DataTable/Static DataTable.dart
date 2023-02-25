import 'package:flutter/material.dart';

// login is valid or not

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class student {
  String id = "";

  String name = "";

  student({required this.id, required this.name});
}

class MyState extends State<mywidget> {
  List<DataRow> getRows() {
    List<DataRow> rowss = [];
    student s1 = student(id: '1', name: 'rajesh');
    DataRow d1 =
        DataRow(cells: [DataCell(Text(s1.id)), DataCell(Text(s1.name))]);
    rowss.add(d1);
    return rowss;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("DataTable Widget"),
        centerTitle: true,
        
      ),
      body: DataTable(columns: [
        DataColumn(label: Text("id")),
        DataColumn(label: Text("Name")),
      ], rows: getRows()),
    )));
  }
}
