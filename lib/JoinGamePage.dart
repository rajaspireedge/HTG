import 'dart:math';

import 'package:flutter/material.dart';

class JoinGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Join Game'),
    );
  }
}

Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemCount: 10,
    primary: false,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Text("First Rule",
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                        fontFamily: 'Poppins'))),
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text("50",
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: Colors.orange,
                        fontFamily: 'Poppins'))),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: new BorderRadius.circular(40)),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Text("1500",
                    style: new TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontFamily: 'Poppins')))
          ],
        ),
      );
    },
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Color> manyColors = [
      Colors.white,
    ];

    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];
    int z = 0;
    for (int i = 0; i <= 10; i++) {
      int maxColNr = 2;
      for (int y = 0; y <= maxColNr; y++) {
        int currentNumber = z + y; // 0,1,2,3,4,5,6,7,8,9,10, 10,11, 12, 13,14
        columnNumbers.add(currentNumber);
      }
      z += maxColNr;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }
    print(numbers);

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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: Table(
                  children: [
                    TableRow(
                      children: myRowChildren,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.orange,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  child: Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: new BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: Text("Rule Type",
                            style: new TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontFamily: 'Poppins'))),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Winners",
                            style: new TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontFamily: 'Poppins'))),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                        child: Text("Winners Prize",
                            style: new TextStyle(
                                fontSize: 10.0,
                                color: Colors.black,
                                fontFamily: 'Poppins')))
                  ],
                ),
              )),
              _myListView(context)
            ],
          ),
        ));
  }
}
