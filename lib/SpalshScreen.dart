import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:htg/CreateContest.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/creatingandjoin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final FirebaseMessaging _fcm = FirebaseMessaging();

    _fcm.getToken().then((value) => print(value));

    getStringValuesSF().then((value) {
      if (value == null) {
        Timer(
            Duration(seconds: 9),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen())));
      } else {
        Timer(
            Duration(seconds: 9),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => CreateAndJoin())));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash.gif'),
      ),
    );
  }

  Future<dynamic> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return
    return prefs.getString('userID');
  }
}
