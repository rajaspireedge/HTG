import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/JoinGamePage.dart';

class Mycontestdetail extends StatefulWidget {
  @override
  _MycontestdetailState createState() => _MycontestdetailState();
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
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
                        fontFamily: 'Muli'))),
            Container(
                padding: EdgeInsets.all(5.0),
                child: Text("50",
                    style: new TextStyle(
                        fontSize: 10.0,
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
                        fontSize: 10.0,
                        color: Colors.white,
                        fontFamily: 'Muli')))
          ],
        ),
      );
    },
  );
}

TextStyle styleorange =
    TextStyle(fontFamily: 'Muli-Regular', fontSize: 10.0);

class _MycontestdetailState extends State<Mycontestdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFEE802E),
        title: new Text("Contest Detail"),
        leading: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Material(
            shape: new CircleBorder(),
          ),
        ),
      ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                fit: StackFit.loose,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                                child: Container(
                              width: double.infinity,
                              height: 60,
                              child: Container(
                                margin:
                                    EdgeInsets.fromLTRB(40.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Housey",
                                        style: new TextStyle(
                                            fontSize: 10.0,
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
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                              ),
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                            )),
                            SizedBox(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Text("200\nwinners",
                                      style: new TextStyle(
                                          fontSize: 8.0,
                                          color: Colors.black,
                                          fontFamily: 'Muli-Light')),
                                  alignment: Alignment.center,
                                  margin:
                                      EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                ),
                                Container(
                                  child: Text("3 Crores",
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xFFEE802E),
                                          fontFamily: 'Muli')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  child: Text("4 Rs",
                                      style: new TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.black,
                                          fontFamily: 'Muli')),
                                  alignment: Alignment.center,
                                  margin:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                ),
                              ],
                            )),
                            SizedBox(
                                child: Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                style: styleorange,
                              ),
                              alignment: Alignment.center,
                            )),
                            SizedBox(
                                child: Container(
                              margin: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                  color: Color(0xFFEE802E),
                                  borderRadius: new BorderRadius.circular(40)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      margin: EdgeInsets.fromLTRB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text("Rule Type",
                                          style: new TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black,
                                              fontFamily: 'Muli'))),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text("Winners",
                                          style: new TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black,
                                              fontFamily: 'Muli'))),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      margin: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Text("Winners Prize",
                                          style: new TextStyle(
                                              fontSize: 10.0,
                                              color: Colors.black,
                                              fontFamily: 'Muli')))
                                ],
                              ),
                            )),
                            _myListView(context),
                            SizedBox(
                              child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              JoinGame())),
                                  child: Container(
                                    margin: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFEE802E),
                                        borderRadius:
                                            new BorderRadius.circular(40)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            padding: EdgeInsets.all(10.0),
                                            margin: EdgeInsets.fromLTRB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text("Join Game",
                                                style: new TextStyle(
                                                    fontSize: 10.0,
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
                      )),
                  Container(
                    width: 150.0,
                    transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                    height: 25.0,
                    margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    alignment: Alignment.center,
                    child: Text("1h : 20m : 5s",
                        style: new TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                            fontFamily: 'Muli-ExtraBold')),
                    decoration: BoxDecoration(
                        color: Color(0xFFEE802E),
                        borderRadius: new BorderRadius.circular(4.0)),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
