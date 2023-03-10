import 'package:flutter/material.dart';

class client {
  String text;
  // String name;

  client({ required this.text});

  Map<String, dynamic> toMap() {
    var m1 = {
      
      'text': text,
    };
    return m1;
  }

  @override
  String toString() {
    return "text=$text";
  }
}
