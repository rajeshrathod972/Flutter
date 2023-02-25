import 'package:flutter/material.dart';

// login is valid or not

class mywidget1 extends StatefulWidget {
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

class MyState extends State<mywidget1> {
  List<student> getstudent() {
    List<student> students = [];
    student s1 = new student(id: '1', name: 'Rajesh');
    student s2 = new student(id: '2', name: 'Gopal');
    students.add(s1);
    students.add(s2);
    return students;
  }

  List<DataRow> getRows() {
    List<DataRow> rowss = [];
    List<student> st = getstudent();
    for (var t in st) {
      DataRow d1 =
          DataRow(cells: [DataCell(Text(t.id)), DataCell(Text(t.name))]);
      rowss.add(d1);
    }
    return rowss;
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Dynamic DataTable Widget"),
        centerTitle: true,
      ),
      body: DataTable(columns: [
        DataColumn(label: Text("id")),
        DataColumn(label: Text("Name")),
      ], rows: getRows()),
    )));
  }
}
