import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Creategame extends StatefulWidget {
  @override
  _CreategameState createState() => _CreategameState();
}

class _CreategameState extends State<Creategame> {
  var entergamename = TextEditingController();
  var entercreatorname = TextEditingController();
  var gametime = TextEditingController();
  var gamename = TextEditingController();
  var gamedate = TextEditingController();
  var gamedescription = TextEditingController();
  var totalplayers = TextEditingController();
  var totalamount = TextEditingController();
  var entryfeeamount = TextEditingController();
  var gamerules = TextEditingController();
  var winneramount = TextEditingController();
  var totalwinner = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Contest',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0, color: Colors.white, fontFamily: 'Poppins'),
              ),
            ],
          )),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage("assets/images/gallery.png"),
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: entergamename,
                obscureText: false,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 14.0,
                    color: Colors.orange),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter game name",
                  counter: Offstage(),
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14.0,
                      color: Colors.orange),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: TextField(
                controller: entercreatorname,
                obscureText: false,
                style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 14.0,
                    color: Colors.orange),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter creator name",
                  counter: Offstage(),
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      fontSize: 14.0,
                      color: Colors.orange),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Flexible(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(left: 20, right: 5),
                    child: TextField(
                      controller: gametime,
                      obscureText: false,
                      style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 14.0,
                          color: Colors.orange),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.access_time_outlined,
                          color: Colors.orange,
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Game time",
                        counter: Offstage(),
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14.0,
                            color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(right: 20, left: 5),
                    child: TextField(
                      controller: gamedate,
                      obscureText: false,
                      style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 14.0,
                          color: Colors.orange),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.orange,
                        ),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Game date",
                        counter: Offstage(),
                        hintStyle: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14.0,
                            color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ))
                ],
              )),
            )),
            Container(
                height: 150,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.orange)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: TextField(
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 14.0,
                              color: Colors.orange),
                          controller: gamedescription,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                            contentPadding: EdgeInsets.all(18),
                            hintText: "Description",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                fontSize: 14.0,
                                color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
