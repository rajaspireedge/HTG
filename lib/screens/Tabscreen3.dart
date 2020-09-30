import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tab3 extends StatefulWidget {
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> with AutomaticKeepAliveClientMixin<Tab3> {
  @override
  void initState() {
    super.initState();
    print('initState Tab3');
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab3');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Create / Join Contest',
            style: TextStyle(
                fontSize: 15.0, color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 180.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: Colors.orange,
                      borderRadius: new BorderRadius.circular(2.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Create Game',
                        style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                    ),
                    width: 60,
                    height: 60,
                    transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ],
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    width: 180.0,
                    height: 100.0,
                    margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(2.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Join Game',
                        style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.orange,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    width: 60,
                    height: 60,
                    transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
