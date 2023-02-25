import 'package:flutter/material.dart';
import 'package:github/second%20page.dart';

import 'Shared preference.dart';



void main() {
  runApp(MaterialApp(initialRoute: '/first',routes: {'/first':(context) => mywidget1(),'/second':(context) => second()},));
}


