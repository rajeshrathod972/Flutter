import 'package:chatapp/client.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Whatsapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';
  DatabaseReference db = FirebaseDatabase.instance.ref().child("Rajesh");
  DatabaseReference db2 = FirebaseDatabase.instance.ref().child("jignesh");

  final ref = FirebaseDatabase.instance.ref("Rajesh");
    final ref2 = FirebaseDatabase.instance.ref("jignesh");

  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var p = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'whatsapp',
            style: TextStyle(color: Color.fromARGB(255, 225, 210, 210)),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera)),
            IconButton(onPressed: null, icon: Icon(Icons.search)),
            IconButton(onPressed: null, icon: Icon(Icons.menu))
          ],
        ),
        body: Column(children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref2,
                  itemBuilder: (context, snapshot, animation, index) {
                    return ListTile(
                      title: Text(
                        snapshot.child('text').value.toString(),
                        textAlign: TextAlign.right,
                      ),
                    );
                  })),
          TextField(
            controller: p,
            decoration: InputDecoration(hintText: "enter text"),
          ),
          IconButton(
              onPressed: () {
                var t = p.text;
                client c = client(text: "$t");
                db.push().set("$t");
                p.clear();
              },
              icon: Icon(Icons.send))
        ]));
  }
}
