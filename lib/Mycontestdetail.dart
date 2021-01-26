import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:htg/GenerateNumberScreen.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/GamePage.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/TabMaker.dart';
import 'package:http/http.dart' as http;

import 'package:htg/screens/MyContest.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class Mycontestdetail extends StatefulWidget {
  String id;

  Mycontestdetail(this.id);

  @override
  _MycontestdetailState createState() => _MycontestdetailState(this.id);
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

TextStyle styleorange = TextStyle(fontFamily: 'Muli-Regular', fontSize: 14.0);

class _MycontestdetailState extends State<Mycontestdetail> {
  String id;

  _MycontestdetailState(this.id);

  Map<String, dynamic> snapgetcontest = Map();
  List<dynamic> rulelist = [];

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      itemCount: rulelist.length,
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
                  padding: EdgeInsets.only(top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      color: Color(0xFF39B54A),
                      borderRadius: new BorderRadius.circular(5)),
                  child: Container(
                    width: 60,
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

  Future<String> getContest() async {
    var res = await http.get(
        Uri.encodeFull(RestDatasource.Contest + "/" + id + "/details"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });

    var resBody = json.decode(res.body);
    print(res.body);

    setState(() {
      snapgetcontest = resBody["Data"];
      rulelist = snapgetcontest["ContestRules"];
      print(rulelist);
    });

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    print('initState Tab1');
    this.getContest();
  }

  @override
  Widget build(BuildContext context) {
    print(id);

    RestDatasource api = new RestDatasource();

    if (snapgetcontest.isEmpty) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Loading(
            indicator: BallPulseIndicator(),
            size: 100.0,
            color: Color(0xFFEE802E),
          ),
        ),
      );
    }

    return Scaffold(
        body: WillPopScope(
      child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 100,
                  color: Color(0xFFEE802E),
                  child: Container(
                    margin: EdgeInsets.only(left: 80, top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(snapgetcontest["ContestName"],
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontFamily: 'Muli-Light')),
                        Text("John Doe",
                            style: new TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontFamily: 'Muli'))
                      ],
                    ),
                  )),
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                  snapgetcontest["MaxPlayers"].toString() +
                                      " winners",
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: greycolor,
                                      fontFamily: 'Muli-Light')),
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            ),
                            Container(
                              child: Text(
                                  snapgetcontest["TicketPrice"].toString(),
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: orangecolor,
                                      fontFamily: 'Muli')),
                              alignment: Alignment.center,
                            ),
                            Container(
                              child: Text(
                                  snapgetcontest["TotalAmount"].toString() +
                                      " Entry Fee",
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: greycolor,
                                      fontFamily: 'Muli')),
                              alignment: Alignment.center,
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            ),
                          ],
                        )),
                        SizedBox(
                            child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontFamily: 'Muli'),
                          ),
                          alignment: Alignment.center,
                        )),
                        SizedBox(
                            child: Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          decoration: BoxDecoration(
                              color: _colorFromHex("#FDE6D5"),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 80,
                                  margin:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
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
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  child: Text("Winners Prize",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: 'Muli')))
                            ],
                          ),
                        )),
                        _myListView(context),
                        SizedBox(
                          child: GestureDetector(
                              onTap: () => {
                                    api.getStringValuesSF().then((value) => {
                                          print("createdby "+value),
                                          if (value ==
                                              snapgetcontest["CreatedBy"])
                                            {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              GenerateNumber(
                                                                  snapgetcontest[
                                                                      "_id"])))
                                            }
                                          else
                                            {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              JoinGame(
                                                                  snapgetcontest[
                                                                      "_id"])))
                                            }
                                        })
                                  },
                              child: Container(
                                margin: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFEE802E),
                                    borderRadius:
                                        new BorderRadius.circular(40)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Text("Join Game",
                                            style: new TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontFamily: 'Muli'))),
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0)),
                  ),
                  /*  Card(
                    child: Container(
                      width: 150.0,
                      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("1h : 20m : 5s",
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFFEE802E),
                                fontFamily: 'Muli-Bold')),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(4.0)),
                    ),
                  ),*/

                  Container(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text("1h : 20m : 5s",
                            style: new TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFFEE802E),
                                fontFamily: 'Muli-Bold')),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CreateAndJoin()));
      },
    ));
  }
}
