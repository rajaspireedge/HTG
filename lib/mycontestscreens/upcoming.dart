import 'package:flutter/material.dart';

import '../Mycontestdetail.dart';
class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_return
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => Mycontestdetail(""))),
                child: Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  fit: StackFit.loose,
                  children: <Widget>[
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 10.0),
                        child: Container(
                          height: 150,
                          child: Column(
                            children: <Widget>[
                              Container(
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
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                ),
                                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Text("200\nwinners",
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontFamily: 'Muli-Light')),
                                    alignment: Alignment.center,
                                    margin:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                  ),
                                  Container(
                                    child: Text("3 Crores",
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFFEE802E),
                                            fontFamily: 'Muli')),
                                    alignment: Alignment.center,
                                  ),
                                  Container(
                                    child: Text("4 Rs",
                                        style: new TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontFamily: 'Muli')),
                                    alignment: Alignment.center,
                                    margin:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  ),
                                ],
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
                              fontSize: 14.0,
                              color: Colors.white,
                              fontFamily: 'Muli-ExtraBold')),
                      decoration: BoxDecoration(
                          color: Color(0xFFEE802E),
                          borderRadius: new BorderRadius.circular(4.0)),
                    ),
                  ],
                ),
              );
            })    );

  }
}
