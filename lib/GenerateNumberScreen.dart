import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:htg/Mycontestdetail.dart';
import 'package:htg/RestDatasource.dart';
import 'package:http/http.dart' as http;

class GenerateNumber extends StatelessWidget {
  Map<String, dynamic> contestdetail = Map();

  GenerateNumber(this.contestdetail);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenerateNumberFull(contestdetail),
    );
  }
}

class GenerateNumberFull extends StatefulWidget {
  Map<String, dynamic> contestdetail = Map();

  GenerateNumberFull(this.contestdetail);

  @override
  _GenerateNumberFullState createState() =>
      _GenerateNumberFullState(contestdetail);
}

class _GenerateNumberFullState extends State<GenerateNumberFull> {
  Map<String, dynamic> contestdetail = Map();

  _GenerateNumberFullState(this.contestdetail);

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);
  ScrollController controller = new ScrollController();

  List<dynamic> contestnumbers = [];
  bool boxvisible = false;
  int lastnumber = 0;

  Future<String> getContest(String userid) async {
    var res = await http.get(
        Uri.encodeFull(RestDatasource.Contest +
            "/" +
            contestdetail["_id"] +
            "/details?UserId=" +
            userid),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    var resBody = json.decode(res.body);
    print(res.body);

    setState(() {
      contestdetail = resBody["Data"];
    });

    return "Success";
  }

  Future<String> getGenerateNumber() async {
    var res = await http.post(
        Uri.encodeFull(
            RestDatasource.Contest + "/" + contestdetail["_id"] + "/number"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    var resBody = json.decode(res.body);
    setState(() {
      getGetGenerateNumber();
    });
    return "Success";
  }

  Future<String> getGetGenerateNumber() async {
    var res = await http.get(
        Uri.encodeFull(
            RestDatasource.Contest + "/" + contestdetail["_id"] + "/number"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    var resBody = json.decode(res.body);

    setState(() {
      contestnumbers = resBody["Data"]["Numbers"];

      if (contestnumbers.length == 0) {
        boxvisible = false;
      } else {
        boxvisible = true;
      }

      lastnumber = resBody["Data"]["LastNumber"];
      contestnumbers.remove(resBody["Data"]["LastNumber"]);
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getGetGenerateNumber();
  }

  @override
  Widget build(BuildContext context) {
    var color = Color(0xFFEE802E);
    bool buttonvis = false;

    RestDatasource api = new RestDatasource();

    Widget Startbutton() {
      if (contestdetail["IsRunning"] == true) {
        buttonvis = true;
        return GestureDetector(
          onTap: () {
            getGenerateNumber();
          },
          child: Container(
              decoration: BoxDecoration(
                  color: orangecolor,
                  borderRadius: new BorderRadius.circular(20.0)),
              padding: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
              child: Text("Generate",
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontFamily: 'Muli'))),
        );
      }

      buttonvis = false;


      return GestureDetector(
        onTap: () {
          api.startcontest(contestdetail["_id"], context).then((value) =>
              api.getStringValuesSF().then((value) => getContest(value)));
        },
        child: Container(
            decoration: BoxDecoration(
                color: orangecolor,
                borderRadius: new BorderRadius.circular(20.0)),
            padding: EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
            child: Text("Start",
                style: new TextStyle(
                    fontSize: 14.0, color: Colors.white, fontFamily: 'Muli'))),
      );
    }

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
              if (contestnumbers.contains(nr) || lastnumber == nr) {
                return Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  color: orangecolor,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      nr.toString(),
                    ),
                  ),
                );
              }

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
                          width: double.infinity,
                          height: 120,
                          color: Color(0xFFEE802E),
                          child: Container(
                              margin: EdgeInsets.only(left: 20, top: 55),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Mycontestdetail(
                                                      contestdetail["_id"])));
                                    },
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(right: 20),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/back.png'),
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(contestdetail["ContestName"],
                                          style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontFamily: 'Muli-Light')),
                                      Text("John Doe",
                                          style: new TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              fontFamily: 'Muli'))
                                    ],
                                  ),
                                ],
                              ))),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 50,
                              width: 130,
                              margin: EdgeInsets.only(left: 20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(0),
                                controller: controller,
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Text(
                                                contestnumbers[index]
                                                    .toString(),
                                                style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'Muli')),
                                          )
                                        ],
                                      ));
                                },
                                itemCount: contestnumbers.length,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: boxvisible,
                            child: Container(
                              child: Card(
                                elevation: 10,
                                shadowColor: Colors.white,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(lastnumber.toString(),
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: orangecolor,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Muli')),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              transform:
                                  Matrix4.translationValues(0.0, -30.0, 0.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: EdgeInsets.only(top: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFEE802E),
                                    borderRadius:
                                        new BorderRadius.circular(20)),
                                child: GestureDetector(
                                  onTap: () {
                                    api.startcontest(
                                        contestdetail["_id"], context);
                                  },
                                  child: Startbutton(),
                                )),
                          )
                        ],
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
                    builder: (BuildContext context) =>
                        Mycontestdetail(contestdetail["_id"])));
              })),
    );
  }
}
