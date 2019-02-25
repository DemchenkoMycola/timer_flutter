import 'package:flutter/material.dart';
import './Timer.dart' as timer;
import './History.dart' as history;

void main() {
  runApp(new MaterialApp(
      home: new MyTabs()
  ));
}

class MyTabs extends StatefulWidget{
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{

  TabController controller;

  @override
  void initState(){
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(title: new Text("Pages"), backgroundColor: Colors.indigo,
        ),
        bottomNavigationBar: new Material(
            color: Colors.indigo,
            child: new TabBar(
                controller: controller,
                tabs: <Tab>[
                  new Tab(icon: new Icon(Icons.home)),
                  new Tab(icon: new Icon(Icons.history)),
                ]
            )
        ),
        body: new TabBarView(
            controller: controller,
            children: <Widget>[
              new timer.TimerApp(),
              new history.History(),
            ]
        )
    );
  }
}
