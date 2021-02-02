import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/TabMaker.dart';
import 'package:http/http.dart' as http;

class JoinGame extends StatelessWidget {
  Map<String, dynamic> contestdetail = Map();

  JoinGame(this.contestdetail);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(contestdetail),
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
                width: 70,
                alignment: Alignment.center,
                padding: EdgeInsets.all(5.0),
                child: Text("50",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFEE802E),
                        fontFamily: 'Muli'))),
            Container(
                width: 120,
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Color(0xFF39B54A),
                      borderRadius: new BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: Text("\u20B9" + "1500",
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
  Map<String, dynamic> contestdetail = Map();

  MyHomePage(this.contestdetail);

  @override
  _MyHomePageState createState() => _MyHomePageState(contestdetail);
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> contestdetail = Map();

  _MyHomePageState(this.contestdetail);

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);
  ScrollController controller = new ScrollController();

  List<dynamic> contestnumbers = [];
  List<dynamic> selectednumber = [];
  List<dynamic> tablenumbers0 = [];
  List<dynamic> tablenumbers1 = [];
  List<dynamic> tablenumbers2 = [];
  List<dynamic> ContestRules = [];

  bool boxvisible = false;
  int lastnumber = 0;
  bool rightdesign = false;

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

  Future<String> getTableNumbers() async {
    var res = await http.get(
        Uri.encodeFull(RestDatasource.createcontests +
            "/" +
            contestdetail["CreatedBy"] +
            "/contestticket/" +
            contestdetail["_id"]),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    var resBody = json.decode(res.body);

    setState(() {
      List<dynamic> tablenumbersrows = [];
      tablenumbersrows = resBody["Data"]["HouseyTicket"];

      for (int i = 0; i < tablenumbersrows.length; i++) {
        tablenumbers0 = tablenumbersrows[0];
        tablenumbers1 = tablenumbersrows[1];
        tablenumbers2 = tablenumbersrows[2];
      }
    });

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getGetGenerateNumber();
    this.getTableNumbers();
  }

  @override
  Widget build(BuildContext context) {
    ContestRules = contestdetail["ContestRules"];

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
                                margin: EdgeInsets.only(left: 5, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text(
                                          contestnumbers[index].toString(),
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
                    Container(
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
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                    ),
                  ],
                ),
              ],
            ),
            Container(
                decoration: BoxDecoration(
                    color: orangecolor,
                    borderRadius: new BorderRadius.circular(20.0)),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
                child: Text("Claim",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: 'Muli'))),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: orangecolor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: orangecolor, width: 2))),
                      child: ListView.builder(
                        itemCount: tablenumbers0.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          int lastindex = tablenumbers0.length - 1;

                          if (index == lastindex) {
                            if (selectednumber.contains(tablenumbers0[index]) &&
                                tablenumbers0[index] != 0) {
                              return Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bgimgno.png'))),
                                  margin: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectednumber
                                            .add(tablenumbers0[index]);
                                      });
                                    },
                                    child: Text(tablenumbers0[index].toString(),
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Muli')),
                                  ));
                            }

                            return Container(
                                width: 30,
                                height: 10,
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers0[index]);
                                    });
                                  },
                                  child: Text(tablenumbers0[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          if (selectednumber.contains(tablenumbers0[index]) &&
                              tablenumbers0[index] != 0) {
                            return Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: orangecolor, width: 2)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bgimgno.png'))),
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers0[index]);
                                    });
                                  },
                                  child: Text(tablenumbers0[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          return Container(
                              width: 30,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: orangecolor, width: 2))),
                              margin: EdgeInsets.only(
                                right: 5,
                              ),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectednumber.add(tablenumbers0[index]);
                                  });
                                },
                                child: Text(tablenumbers0[index].toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Muli')),
                              ));
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: orangecolor, width: 2))),
                      child: ListView.builder(
                        itemCount: tablenumbers0.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          int lastindex = tablenumbers1.length - 1;

                          if (index == lastindex) {
                            if (selectednumber.contains(tablenumbers1[index]) &&
                                tablenumbers1[index] != 0) {
                              return Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bgimgno.png'))),
                                  margin: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectednumber
                                            .add(tablenumbers1[index]);
                                      });
                                    },
                                    child: Text(tablenumbers1[index].toString(),
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Muli')),
                                  ));
                            }

                            return Container(
                                width: 30,
                                height: 10,
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers1[index]);
                                    });
                                  },
                                  child: Text(tablenumbers1[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          if (selectednumber.contains(tablenumbers1[index]) &&
                              tablenumbers1[index] != 0) {
                            return Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: orangecolor, width: 2)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bgimgno.png'))),
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers1[index]);
                                    });
                                  },
                                  child: Text(tablenumbers1[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          return Container(
                              width: 30,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: orangecolor, width: 2))),
                              margin: EdgeInsets.only(
                                right: 5,
                              ),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectednumber.add(tablenumbers1[index]);
                                  });
                                },
                                child: Text(tablenumbers1[index].toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Muli')),
                              ));
                        },
                      ),
                    ),
                    Container(
                      height: 40,
                      child: ListView.builder(
                        itemCount: tablenumbers2.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          int lastindex = tablenumbers2.length - 1;

                          if (index == lastindex) {
                            if (selectednumber.contains(tablenumbers2[index]) &&
                                tablenumbers2[index] != 0) {
                              return Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/bgimgno.png'))),
                                  margin: EdgeInsets.only(
                                    right: 5,
                                  ),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectednumber
                                            .add(tablenumbers2[index]);
                                      });
                                    },
                                    child: Text(tablenumbers2[index].toString(),
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Muli')),
                                  ));
                            }

                            return Container(
                                width: 30,
                                height: 10,
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers2[index]);
                                    });
                                  },
                                  child: Text(tablenumbers2[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          if (selectednumber.contains(tablenumbers2[index]) &&
                              tablenumbers2[index] != 0) {
                            return Container(
                                width: 30,
                                height: 10,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: orangecolor, width: 2)),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/bgimgno.png'))),
                                margin: EdgeInsets.only(
                                  right: 5,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectednumber.add(tablenumbers2[index]);
                                    });
                                  },
                                  child: Text(tablenumbers2[index].toString(),
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                ));
                          }

                          return Container(
                              width: 30,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: orangecolor, width: 2))),
                              margin: EdgeInsets.only(
                                right: 5,
                              ),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectednumber.add(tablenumbers2[index]);
                                  });
                                },
                                child: Text(tablenumbers2[index].toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: 'Muli')),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
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
