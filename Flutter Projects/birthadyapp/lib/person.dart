import 'dart:io';

class person {
  late String name;
  late String contNo;
  late String DoB;
  person({required this.name, required this.contNo, required this.DoB});

  Map<String, dynamic> tomap() {
    var m1 = {'name': name, 'contNo': contNo, 'DoB': DoB};
    return m1;
  }

  @override
  String toString() {
    return "name=$name,contNo=$contNo,DoB=$DoB";
  }
}
