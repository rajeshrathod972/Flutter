import 'package:firebase_card/card.dart';
import 'package:firebase_card/create.dart';
import 'package:firebase_card/delete.dart';
import 'package:firebase_card/edit.dart';
import 'package:firebase_card/table.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'mainscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // '/': (context) => table(),
      '/': (context) => card(),
      // '/table': (context) => table(),
      // '/create': (context) => create(),

    },
  ));
}
