import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htg/creategame.dart';

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
          backgroundColor: Color(0xFFEE802E),
          title: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 100),
                child: Image.asset(
                  'assets/images/BLRLOGO.png',
                  height: 200,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Create Contest',
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white, fontFamily: 'Muli'),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Creategame())),
                    child: new Container(
                        width: 160,
                        height: 60,
                        decoration: new BoxDecoration(
                          color: Color(0xFFEE802E),
                          borderRadius: new BorderRadius.circular(2.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Center(
                              child: new Text(
                                'Create Game',
                                style: new TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: 'Muli'),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    right: 20,
                    child: Container(
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.all(7),
                          child: Image(
                            image: AssetImage('assets/images/plus.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFEE802E)),
                      ),
                      width: 40,
                      transform: Matrix4.translationValues(40.0, 0.0, 0.0),
                      height: 40,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("or",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'Muli-Light')),
              ),
              Stack(
                children: [
                  new Container(
                    width: 160.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFF1F1F1), width: 5),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: new Center(
                      child: new Text(
                        'Join Game',
                        style: new TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFFEE802E),
                            fontFamily: 'Muli'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: Container(
                      child: Container(
                        child: Container(
                          margin: EdgeInsets.all(7),
                          child: Image(
                            image: AssetImage('assets/images/people.png'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      width: 40,
                      transform: Matrix4.translationValues(40.0, 0.0, 0.0),
                      height: 40,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFEE802E)),
                    ),
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
