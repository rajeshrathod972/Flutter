import 'package:firebase_card/edit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'databaseservices.dart';
import 'firebase_options.dart';

import 'package:fluttertoast/fluttertoast.dart';

class card extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<card> {
  mydb sb = mydb();
  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();
  var mycontroller3 = TextEditingController();
  var mycontroller4 = TextEditingController();
  var mycontroller5 = TextEditingController();
  var name = '';
  var age = '';
  var DoB = '';
  var phoneNo = '';
  var address = '';
  // List<Card> cards = [];

  // getcard() async {
  //   /////////////////////////////////////////////////////
  //      DataSnapshot p = await sb.select("person/{Rajesh Rathod}");
  //     setState(() {
  //       name = p.child('name').value.toString();
  //       age = p.child('age').value.toString();
  //       DoB = p.child('DoB').value.toString();
  //       phoneNo = p.child('phoneNo').value.toString();
  //       address = p.child('address').value.toString();

  //       cards.add(Card(
  //           color: Colors.amber,
  //           child: Column(children: [
  //             ListTile(
  //               leading: Icon(Icons.man),
  //               title: Text("$name"),
  //             ),
  //             ListTile(
  //               title: Text("Age:$age" + "    " + "DoB:$DoB"),
  //             ),
  //             ListTile(
  //               title: Text("Phone:$phoneNo" + "    " + "address:$address"),
  //             ),
  //             ButtonBar(
  //               alignment: MainAxisAlignment.end,
  //               children: [
  //                 ElevatedButton(
  //                     onPressed: (() {
  //                       Navigator.pushNamed(context, '/edit');
  //                     }),
  //                     child: Text("Edit")),
  //                 ElevatedButton(
  //                     onPressed: (() {
  //                       Navigator.pushNamed(context, '/delete');
  //                     }),
  //                     child: Text("Delete"))
  //               ],
  //             )
  //           ])));
  //     });
  //   }

  Query dbref = FirebaseDatabase.instance.ref().child('person');
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("person");
  Widget listItem({required Map person}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      color: Colors.amberAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            person['name'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            person['age'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            person['DoB'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            person['phoneNo'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            person['address'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              edit(personkey: person['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  ref.child(person['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text("card"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  // getcard();
                  // cards.clear();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: Container(
          child: FirebaseAnimatedList(
              query: dbref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map person = snapshot.value as Map;
                person['key'] = snapshot.key;

                return listItem(person: person);
              }),
          height: double.infinity,
        )
        )
        );
  }
}
