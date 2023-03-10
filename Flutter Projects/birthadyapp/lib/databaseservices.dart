import 'package:birthday/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class jems {
  late Future<Database> db;
  Future<void> open() async {
    db = openDatabase(
      join(await getDatabasesPath(), "bond.db"),
      version: 1,
      onCreate: (db, version) {
        return (db.execute(
            "create table person(name varchar(45),contNo varchar(45),DoB varchar(45))"));
      },
    );
    
        
  }

  insert(person bond) async {
    Database db2 = await db;
    db2.insert('person', bond.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    Fluttertoast.showToast(
        msg: "data inserted successfully",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.red);
  }

  select(name) async {
    Database db2 = await db;
    var rows = await db2.query('person', where: "name=?", whereArgs: [name]);
     Fluttertoast.showToast(
        msg: "data selected successfully",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.green);
    return rows;
   
  }
  selectall() async {
    Database db2 = await db;
    var values = await db2.query("person");
     Fluttertoast.showToast(
        msg: "data selectedall successfully",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.blue);
    return values;
  }

  delete(name) async {
    Database db2 = await db;
    db2.delete('person', where: "name=?", whereArgs: [name]);
     Fluttertoast.showToast(
        msg: "data deleted successfully",
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.red);
  }

  update(person p1) async {
    Database db2 = await db;
    db2.update('person', p1.tomap(), where: "name=?", whereArgs: [p1.name]);
    //  Fluttertoast.showToast(
    //     msg: "data updated successfully",
    //     toastLength: Toast.LENGTH_SHORT,
    //     textColor: Colors.yellow);
  }
}
