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
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: 'Muli'))),
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text("50",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFEE802E),
                        fontFamily: 'Muli'))),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: new BorderRadius.circular(40)),
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: Text("1500",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: 'Muli')))
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
    int currentNumber = 0;
    int z = 1;
    for (int i = 0; i <= 8; i++) {
      int maxColNr = 2;
      for (int y = 0; y <= maxColNr; y++) {
        Random random = new Random();
        int randomNumber = random.nextInt(100); // from
        currentNumber = randomNumber;
        if(columnNumbers.contains(currentNumber)){
          print(currentNumber);
        } else{
          columnNumbers.add(randomNumber);
        }
      }
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
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    color: Color(0xFFEE802E),
                    borderRadius: new BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: Text("Rule Type",
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'Muli'))),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Text("Winners",
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontFamily: 'Muli'))),
                    Container(
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
        ));
  }
}
