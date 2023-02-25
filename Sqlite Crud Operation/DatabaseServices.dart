import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google/student.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class mydb {
  late Future<Database> db;
  Future<void> open() async {
    db = openDatabase(
      join(await getDatabasesPath(), "stud.db"),
      version: 1,
      onCreate: (db, version) {
        return (db.execute(
            "create table student(name varchar(45),username varchar(45),password varchar(45))"));
      },
    );
  }

  insert(student stud) async {
    Database db2 = await db;
    db2.insert('student', stud.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    Fluttertoast.showToast(
        msg: "data inserted successfully",
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.red);
  }

  select(name) async {
    Database db2 = await db;
    var rows = await db2.query('student', where: "name=?", whereArgs: [name]);
    return rows;
  }

  delete(name) async {
    Database db2 = await db;
    db2.delete('student', where: "name=?", whereArgs: [name]);
  }

  update(student st) async {
    Database db2 = await db;
    db2.update('student',st.tomap(),where: "name=?", whereArgs: [st.name]);
  }
}
