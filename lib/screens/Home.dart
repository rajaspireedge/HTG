import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:htg/Mycontestdetail.dart';
import 'package:htg/RestDatasource.dart';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin<Tab1> {
  List<dynamic> snapgetcontest;

  var greycolor = Color(0xFF8F8F8F);
  var orangecolor = Color(0xFFEE802E);

  var _currentValue = 0;

  Future<String> getContest() async {
    var res = await http.get(Uri.encodeFull(RestDatasource.Contest), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    var resBody = json.decode(res.body);
    print(res.body);

    setState(() {
      snapgetcontest = resBody["Data"]["Manual"];
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
    print('build Tab1');

    Color _colorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }

    if (snapgetcontest == null) {
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
      appBar: AppBar(
          backgroundColor: Color(0xFFEE802E),
          title: Stack(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/images/BLRLOGO.png',
                  height: 200,
                ),
              )
            ],
          )),
      // ignore: missing_return
      body: ListView.builder(
          itemCount: snapgetcontest.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Mycontestdetail(snapgetcontest[index]["_id"]))),
              child: Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 60,
                              child: Container(
                                margin:
                                    EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(snapgetcontest[index]["ContestName"],
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontFamily: 'Muli-Light')),
                                    Text("John Doe",
                                        style: new TextStyle(
                                            fontSize: 8.0,
                                            color: Colors.grey,
                                            fontFamily: 'Muli'))
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: _colorFromHex("#FDE6D5"),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                              ),
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                              snapgetcontest[index]
                                                      ["MaxPlayers"]
                                                  .toString(),
                                              style: new TextStyle(
                                                  fontSize: 13.0,
                                                  color: greycolor,
                                                  fontFamily: 'Muli')),
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(
                                              20.0, 0.0, 0.0, 0.0),
                                        ),
                                        Container(
                                          child: Text("winners",
                                              style: new TextStyle(
                                                  fontSize: 13.0,
                                                  color: greycolor,
                                                  fontFamily: 'Muli')),
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(
                                              20.0, 0.0, 0.0, 0.0),
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
                                                snapgetcontest[index]
                                                        ["TotalAmount"]
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
                                                  snapgetcontest[index]
                                                          ["TicketPrice"]
                                                      .toString(),
                                              style: new TextStyle(
                                                  fontSize: 13.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Muli')),
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 20.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 30, right: 30, bottom: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: FAProgressBar(
                                      currentValue: 60,
                                      size: 10,
                                      maxValue: 150,
                                      changeColorValue: 100,
                                      border: Border.all(
                                          color: greycolor, width: 0.3),
                                      backgroundColor: Colors.white,
                                      progressColor: Color(0xFFEE802E),
                                      direction: Axis.horizontal,
                                      verticalDirection: VerticalDirection.up,
                                    ),
                                  )),
                                  SizedBox(
                                    child: GestureDetector(
                                        child: Container(
                                      margin: EdgeInsets.only(left: 30),
                                      padding: EdgeInsets.only(left: 20 , right: 20 , top: 5 , bottom: 5),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEE802E),
                                          borderRadius:
                                              new BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                              child: Text("Join",
                                                  style: new TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.white,
                                                      fontFamily: 'Muli'))),
                                        ],
                                      ),
                                    )),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0)),
                      )),
                  Card(
                    margin: EdgeInsets.only(top: 10),
                    color: Color(0xFFEE802E),
                    child: Container(
                      width: 150.0,
                      height: 20,
                      alignment: Alignment.center,
                      child: Text("1h : 20m : 5s",
                          style: new TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'Muli-ExtraBold')),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
