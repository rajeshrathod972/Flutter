import 'package:flutter/material.dart';
import 'package:github/second%20page.dart';

import 'Navigator Routes.dart';



void main() {
  runApp(MaterialApp(initialRoute: '/first',routes: {'/first':(context) => mywidget1(),'/second':(context) => second()},));
}


