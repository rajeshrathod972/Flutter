import 'package:flutter/material.dart';

// login is valid or not

class mywidget1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class item {
  String items = '';
  String subitem = '';
  item({required this.items, required this.subitem});
}

class MyState extends State<mywidget1> {
  List<bool> states = [false, false];
  getpanellist() {
    List<ExpansionPanel> panels = [];
    List<item> itemss = [
      item(items: 'Bus', subitem: 'car'),
      item(items: 'truck', subitem: 'bike')
    ];

    for (int i = 0; i < itemss.length;i++) {
      panels.add(ExpansionPanel(
          isExpanded: states[i],
          headerBuilder: (context, isExpande) {
            return (ListTile(title: Text(itemss[i].items)));
          },
          body: ListTile(
            title: Text(itemss[i].items),
            subtitle: Text(itemss[i].subitem),
          )));
    }
    return (ExpansionPanelList(
      children: panels,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          states[panelIndex] = !isExpanded;
        });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Dynamic Expansion Widget"),
              centerTitle: true,
            ),
            body: Column(
              children: [getpanellist()],
            ))));
  }
}
