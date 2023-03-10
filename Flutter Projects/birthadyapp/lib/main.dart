import 'package:birthday/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Myapp.dart';
import 'delete.dart';
import 'edit.dart';


void main() {
  runApp(MaterialApp(initialRoute: '/',routes: {'/':(context) => Myapp(),'/create':(context) => create(),'/edit':(context) => edit(),'/delete':(context) => delete()},));
  // return (runApp(create()));
}
