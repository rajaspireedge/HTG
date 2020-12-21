import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:htg/Mycontestdetail.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> with AutomaticKeepAliveClientMixin<Tab1> {
  @override
  void initState() {
    super.initState();
    print('initState Tab1');
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab1');

    Color _colorFromHex(String hexColor) {
      final hexCode = hexColor.replaceAll('#', '');
      return Color(int.parse('FF$hexCode', radix: 16));
    }

    const border = Border(
      top: BorderSide(width: 1.0, color: Colors.grey),
      left: BorderSide(width: 1.0, color: Colors.grey),
      right: BorderSide(width: 1.0, color: Colors.grey),
      bottom: BorderSide(width: 1.0, color: Colors.grey),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Home'),
      ),
      // ignore: missing_return
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => Mycontestdetail())),
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
                                            fontFamily: 'Poppins-Light')),
                                    Text("John Doe",
                                        style: new TextStyle(
                                            fontSize: 8.0,
                                            color: Colors.grey,
                                            fontFamily: 'Poppins'))
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
                                          fontFamily: 'Poppins-Light')),
                                  alignment: Alignment.center,
                                  margin:
                                  EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                ),
                                Container(
                                  child: Text("3 Crores",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.orange,
                                          fontFamily: 'Poppins')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  child: Text("4 Rs",
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontFamily: 'Poppins')),
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
                            fontFamily: 'Poppins-ExtraBold')),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: new BorderRadius.circular(4.0)),
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
