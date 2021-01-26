import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:htg/Mycontestdetail.dart';
import 'package:htg/RestDatasource.dart';

class GenerateNumber extends StatelessWidget {
  String id;

  GenerateNumber(this.id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenerateNumberFull(id),
    );
  }
}

class GenerateNumberFull extends StatefulWidget {
  String id;

  GenerateNumberFull(this.id);

  @override
  _GenerateNumberFullState createState() => _GenerateNumberFullState(id);
}

class _GenerateNumberFullState extends State<GenerateNumberFull> {
  String id;

  _GenerateNumberFullState(this.id);

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);

  @override
  Widget build(BuildContext context) {
    ScrollController controller = new ScrollController();

    var color = Color(0xFFEE802E);

    RestDatasource api = new RestDatasource();

    List<Widget> myRowChildren = [];
    List<List<int>> numbers = [];
    List<int> columnNumbers = [];
    int currentNumber = 0;
    int z = 1;

    for (int i = 0; i <= 9; i++) {
      int maxColNr = 8;
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
              /*  if(nr==85){
                return Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  color: color,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      nr.toString(),
                    ),
                  ),
                );
              }
*/
              return Container(
                alignment: Alignment.center,
                height: 35,
                width: 35,
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

    return MaterialApp(
      home: Scaffold(
          body: WillPopScope(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                        color: color,
                      ),
                      Card(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 100,
                                      child: LimitedBox(
                                        maxWidth: 130,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          controller: controller,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  left: 5, right: 10),
                                              alignment: Alignment.center,
                                              child: Text(index.toString(),
                                                  style: new TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                      fontFamily: 'Muli')),
                                            );
                                          },
                                          itemCount: 10,
                                        ),
                                      )),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: color)),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFEE802E),
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                                child: Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        api.startcontest(id, context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              right: 15,
                                              left: 15),
                                          child: Text("Start",
                                              style: new TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white,
                                                  fontFamily: 'Muli'))),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(left: 20, top: 10),
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              color: Color(0xFFFDE6D5),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 60,
                                      child: Text("Rule Type",
                                          style: new TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Muli')),
                                    ),
                                    Container(
                                      width: 30,
                                      child: Text("Total",
                                          style: new TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Muli')),
                                    ),
                                    Container(
                                      width: 50,
                                      child: Text("Claimed",
                                          style: new TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Muli')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 60,
                                        alignment: Alignment.center,
                                        child: Text("First row",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Muli')),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 30,
                                        child: Text("50",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Muli')),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 50,
                                        child: Text("00",
                                            style: new TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Muli')),
                                      )
                                    ],
                                  );
                                },
                                itemCount: 5,
                              ),
                            )
                          ],
                        ),
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
                    ]),
              ),
              onWillPop: () async {
                return Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Mycontestdetail(id)));
              })),
    );
  }
}
