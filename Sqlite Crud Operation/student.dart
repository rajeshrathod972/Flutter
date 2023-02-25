import 'dart:io';

class student {
  late String name;
  late String username;
  late String password;
  student({required this.name, required this.username, required this.password});

  Map<String, dynamic> tomap() {
    var m1 = {'name': name, 'username': username, 'password': password};
    return m1;
  }

  @override
  String toString() {
    return "name=$name,username=$username,password=$password";
  }
}
