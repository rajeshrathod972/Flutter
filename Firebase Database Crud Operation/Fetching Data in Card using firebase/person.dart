import 'package:flutter/material.dart';

class person {
  String name;
  int age;
  String DoB;
  double phoneNo;
  String address;

  person(
      {required this.name,
      required this.age,
      required this.DoB,
      required this.phoneNo,
      required this.address});

  Map<String, dynamic> toMap() {
    var m1 = {
      'name': name,
      'age': age,
      'DoB': DoB,
      'phoneNo': phoneNo,
      'address': address
    };
    return m1;
  }

  @override
  String toString() {
    return "name=$name,age=$age,DoB=$DoB,phoneNo=$phoneNo,address=$address";

  }
}
