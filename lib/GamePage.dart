import 'dart:math';

import 'package:flutter/material.dart';
import 'package:htg/TabMaker.dart';

class JoinGame extends StatelessWidget {
  String id;

  JoinGame(this.id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(id),
    );
  }
}

Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    primary: false,
    shrinkWrap: true,
    padding: EdgeInsets.only(top: 5),
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.only(right: 12, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5.0),
                width: 80,
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Text("First Rule",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'Muli'))),
            Container(
                width: 50,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                child: Text("50",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFEE802E),
                        fontFamily: 'Muli'))),
            Container(
                width: 80,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 30),
                child: Container(
                  width: 60,
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Color(0xFF39B54A),
                      borderRadius: new BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text("1500",
                      style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Muli-Bold')),
                ))
          ],
        ),
      );
    },
  );
}

class MyHomePage extends StatefulWidget {
  String id;

  MyHomePage(this.id);

  @override
  _MyHomePageState createState() => _MyHomePageState(id);
}

class _MyHomePageState extends State<MyHomePage> {
  String id;

  _MyHomePageState(this.id);

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);
  ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];
    int z = 1;

    for (int i = 0; i <= 8; i++) {
      int maxColNr = 2;
      for (int y = 0; y <= maxColNr; y++) {
        int currentNumber = z + y; // 0,1,2,3,4,5,6,7,8,9,10, 10,11, 12, 13,14
        columnNumbers.add(currentNumber);
      }
      z += maxColNr + 1;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }

    myRowChildren = numbers
        .map(
          (columns) => Column(
            children: columns.map((nr) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    nr.toString(),
                  ),
                ),
              );
            }).toList(),
          ),
        )
        .toList();

    return Scaffold(
        body: WillPopScope(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("Housey The Game",
                                style: new TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Muli')),
                          ),
                          Container(
                            child: Text("John Doe",
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: 'Muli')),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: orangecolor,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 50,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        controller: controller,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: EdgeInsets.only(left: 5, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: Text(index.toString(),
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontFamily: 'Muli')),
                                  )
                                ],
                              ));
                        },
                        itemCount: 0,
                      ),
                    ),
                    Container(
                      child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Table(
                children: [
                  TableRow(
                    children: myRowChildren,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFEE802E),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                child: Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                  color: Color(0xFFFDE6D5),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5.0),
                      width: 80,
                      margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: Text("Rule Type",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Muli'))),
                  Container(
                      width: 70,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5.0),
                      child: Text("Winners",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Muli'))),
                  Container(
                      width: 120,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      child: Text("Winners Prize",
                          style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Muli')))
                ],
              ),
            )),
            _myListView(context)
          ],
        ),
      ),
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CreateAndJoin()));
      },
    ));
  }
}
