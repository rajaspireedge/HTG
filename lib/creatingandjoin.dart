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
      color: Color(0xFFEE802E),
      home: Scaffold(
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xFFEE802E),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            selectedFontSize: 14,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedFontSize: 14,
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/home.png"),
                  ),
                  title: Text("HOME",
                      style:
                          new TextStyle(fontSize: 10.0, fontFamily: 'Muli'))),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/mycontest-01.png"),
                  ),
                  title: Text("MY CONTEST",
                      style: new TextStyle(
                          fontSize: 10.0, fontFamily: 'Muli'))),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/createcontest-01.png"),
                  ),
                  title: Text("CREATE CONTEST",
                      style: new TextStyle(
                          fontSize: 10.0, fontFamily: 'Muli'))),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/images/more.png"),
                  ),
                  title: Text("MORE",
                      style: new TextStyle(
                          fontSize: 10.0, fontFamily: 'Muli'))),
            ]),
        backgroundColor: Color(0xFFEE802E),
      ),
    );
  }
}
