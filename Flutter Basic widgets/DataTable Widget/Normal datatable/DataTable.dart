import 'package:flutter/material.dart';

// login is valid or not

class mywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget> {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("DataTable Widget"),
        centerTitle: true,
      ),
      body: DataTable(columnSpacing: 80,columns: [
        DataColumn(label: Text("Name")),
        DataColumn(label: Text("Age")),
        DataColumn(label: Text("PhoneNo"))
      ], rows: [DataRow(cells: [DataCell(Text("Rajesh")),DataCell(Text("21")),DataCell(Text("7066781329"))]),
      DataRow(cells: [DataCell(Text("krushna")),DataCell(Text("41")),DataCell(Text("7958693329"))]),
      DataRow(cells: [DataCell(Text("Gopal")),DataCell(Text("59")),DataCell(Text("8899781329"))]),
      DataRow(cells: [DataCell(Text("Bala")),DataCell(Text("13")),DataCell(Text("8966781329"))])]),
    )));
  }
}
