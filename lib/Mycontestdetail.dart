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

TextStyle styleorange = TextStyle(fontFamily: 'Muli-Regular', fontSize: 14.0);

class _MycontestdetailState extends State<Mycontestdetail> {
  String id;

  _MycontestdetailState(this.id);

  Map<String, dynamic> snapgetcontest = Map();
  List<dynamic> rulelist = [];

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);
  RestDatasource api = new RestDatasource();

  Widget button(BuildContext context) {
    String jointext;

    if (snapgetcontest["IsJoin"]) {
      jointext = "Running";
    } else {
      jointext = "Join";
    }

    return SizedBox(
      child: GestureDetector(
          onTap: () => {
                api.getStringValuesSF().then((value) => {
                      print("createdby " + value),
                      if (value == snapgetcontest["CreatedBy"])
                        {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      GenerateNumber(snapgetcontest)))
                        }
                      else
                        {
                          if (snapgetcontest["IsJoin"])
                            {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          JoinGame(snapgetcontest)))
                            }
                          else
                            {
                              api.getStringValuesSF().then((value) =>
                                  api.joincontest(snapgetcontest["_id"], value,
                                      snapgetcontest, context))
                            }
                        }
                    })
              },
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            decoration: BoxDecoration(
                color: Color(0xFFEE802E),
                borderRadius: new BorderRadius.circular(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10.0),
                    child: Text(jointext,
                        style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontFamily: 'Muli'))),
              ],
            ),
          )),
    );
  }

  Widget _myListView(BuildContext context, List<dynamic> ruleslistss) {
    return ListView.builder(
      itemCount: ruleslistss.length,
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 5, left: 20),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 30, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: 80,
                  alignment: Alignment.center,
                  child: Text(ruleslistss[index]["RuleName"],
                      style:
                          new TextStyle(fontSize: 14.0, fontFamily: 'Muli'))),
              Container(
                  width: 80,
                  alignment: Alignment.center,
                  child: Text("50",
                      style:
                          new TextStyle(fontSize: 14.0, fontFamily: 'Muli'))),
              Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Container(
                    width: 60,
                    padding: EdgeInsets.only(top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        color: Color(0xFF39B54A),
                        borderRadius: new BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text("\u20B9" + ruleslistss[index]["Price"],
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

  Future<String> getContest(String userid) async {
    var res = await http.get(
        Uri.encodeFull(
            RestDatasource.Contest + "/" + id + "/details?UserId=" + userid),
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
    api.getStringValuesSF().then((value) => getContest(value));
  }

  @override
  Widget build(BuildContext context) {
    print(id);

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
                                          CreateAndJoin()));
                            },
                            child: Container(
                              alignment: Alignment.topCenter,
                              margin: EdgeInsets.only(right: 20),
                              child: Image(
                                image: AssetImage('assets/images/back.png'),
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(snapgetcontest["ContestName"],
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
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                          snapgetcontest["MaxPlayers"]
                                              .toString(),
                                          style: new TextStyle(
                                              fontSize: 13.0,
                                              color: greycolor,
                                              fontFamily: 'Muli')),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      child: Text("Winners",
                                          style: new TextStyle(
                                              fontSize: 13.0,
                                              color: greycolor,
                                              fontFamily: 'Muli')),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/trophy.png'),
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                        "\u20B9" +
                                            snapgetcontest["TotalAmount"]
                                                .toString(),
                                        style: new TextStyle(
                                            fontSize: 15.0,
                                            color: orangecolor,
                                            fontFamily: 'Muli')),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Text(
                                          "\u20B9" +
                                              snapgetcontest["TicketPrice"]
                                                  .toString(),
                                          style: new TextStyle(
                                              fontSize: 13.0,
                                              color: greycolor,
                                              fontFamily: 'Muli')),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      child: Text("Entry fee",
                                          style: new TextStyle(
                                              fontSize: 13.0,
                                              color: greycolor,
                                              fontFamily: 'Muli')),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                            child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                            style:
                                TextStyle(fontSize: 12.0, fontFamily: 'Muli'),
                          ),
                          alignment: Alignment.center,
                        )),
                        SizedBox(
                            child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                          decoration: BoxDecoration(
                              color: Color(0xFFFDE6D5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Text("Rule Type",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Muli-Bold.ttf'))),
                              Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Winners",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Muli-Bold.ttf'))),
                              Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Winners Prize",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Muli-Bold.ttf')))
                            ],
                          ),
                        )),
                        _myListView(context, rulelist),
                        button(context)
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
