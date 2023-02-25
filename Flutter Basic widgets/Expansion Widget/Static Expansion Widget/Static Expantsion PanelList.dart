import 'package:flutter/material.dart';

// login is valid or not

class mywidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<mywidget1> {
  bool flag1 = false;
  bool flag2 = false;
  ExpansionPanelList getpanellist() {
    return (ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          if (panelIndex == 0) {
            flag1 = !isExpanded;
            

          }
          if(panelIndex==1){
            flag2 = !isExpanded;
          }
        });
      },
      children: [
        ExpansionPanel(isExpanded: flag1,
            headerBuilder: (context, isExpanded) {
              return (ListTile(
                title: Text("item1"),
              ));
            },
            body:ListTile(title: Text("Ex item1"),subtitle: Text("sublist1"),)),
            ExpansionPanel(isExpanded: flag2,
            headerBuilder: (context, isExpanded) {
              return (ListTile(
                title: Text("item2"),
              ));
            },
            body:ListTile(title: Text("Ex item2"),subtitle: Text("sublist2"),))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Dynamic DataTable Widget"),
              centerTitle: true,
            ),
            body: Column(
              children: [getpanellist()],
            ))));
  }
}
