import 'package:flutter/material.dart';
import 'package:htg/screens/Tabscreen1.dart';
import 'package:htg/screens/Tabscreen4.dart';
import 'screens/Tabscreen2.dart';
import 'screens/Tabscreen3.dart';

class CreateAndJoin extends StatefulWidget {
  @override
  _CreateAndJoinState createState() => _CreateAndJoinState();
}

class _CreateAndJoinState extends State<CreateAndJoin> {

  int tabIndex = 0;
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      Tab1(),
      Tab2(),
      Tab3(),
      Tab4(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.orange,
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report_problem),
                title: Text('My Contest'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Create/join'),
              ),  BottomNavigationBarItem(
                icon: Icon(Icons.reorder),
                title: Text('More'),
              ),
            ]),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
