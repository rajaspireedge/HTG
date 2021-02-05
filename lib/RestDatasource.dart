import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:htg/GamePage.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/TabMaker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'network_util.dart';
import 'user.dart';

class RestDatasource {
  static final BASE_URL = "http://157.245.97.187:9090";
  static final Signup = BASE_URL + "/v1/user/register";
  static final SIGNUPURL = BASE_URL + "/v1/user/signin";
  static final Contest = BASE_URL + "/v1/contest";
  static final join = BASE_URL + "/v1/contest/join";
  static final Claim = BASE_URL + "/v1/contest/claim";
  static final createcontests = BASE_URL + "/v1/user";
  static final rule = BASE_URL + "/v1/rule";

  addStringToSF(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', data["_id"]);
  }

  Future<String> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return
    return prefs.getString('userID');
  }

  void loginapi(Map<String, dynamic> map, BuildContext context) async {
    try {
      Response response = await Dio().post(SIGNUPURL, data: map);

      print(response);

      if (response.data["Status"] == "Success") {
        Fluttertoast.showToast(
            msg: "Login Successfully".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);

        addStringToSF(response.data["Data"]);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CreateAndJoin()));
      } else {
        Fluttertoast.showToast(
            msg: "Fail to Login".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {}
  }

  void signup(Map<String, dynamic> map, BuildContext context) async {
    try {
      Response response = await Dio().post(Signup, data: map);

      print(response);
      if (response.data["Status"] == "Success") {
        Fluttertoast.showToast(
            msg: "Created Successfully".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      } else {
        Fluttertoast.showToast(
            msg: "Fail to create".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }


  Future<dynamic> startcontest(String contestid, BuildContext context) async {
    try {
      Response response =
          await Dio().put(Contest + "/" + contestid + "/startcontest");

      if (response.data["Status"] == "Success") {
        Fluttertoast.showToast(
            msg: response.data["Data"]["message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        Fluttertoast.showToast(
            msg: response.data["Error"]["Message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
      return response;
    } catch (e) {
      print(e);
    }

  }

  void claimcontest(String contestid, String userid, String RuleID,
      BuildContext context) async {
    try {
      Response response = await Dio().post(Claim , data: {
        "UserId" : userid,
        "ContestId" : contestid,
        "RuleId" : RuleID,
      });

      print(response);
      if (response.data["Status"] == "Success") {
        Fluttertoast.showToast(
            msg: response.data["Data"]["message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        Fluttertoast.showToast(
            msg: response.data["Error"]["Message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }

  void joincontest(String contestid, String userid, Map<String, dynamic> maps,
      BuildContext context) async {
    try {
      Response response = await Dio().post(join, data: {
        "UserId": userid,
        "ContestId": contestid,
      });

      print(userid);
      print(contestid);
      if (response.data["Status"] == "Success") {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => JoinGame(maps)));

        Fluttertoast.showToast(
            msg: response.data["Data"]["message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      } else {
        Fluttertoast.showToast(
            msg: response.data["Error"]["Message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }

  void postHttp(
      Map<String, dynamic> map, String id, BuildContext context) async {
    try {
      Response response = await Dio()
          .post(createcontests + "/" + id + "/createcontest", data: map);

      if (response.data["Status"] == "Success") {
        Fluttertoast.showToast(
            msg: "Created Successfully".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => CreateAndJoin()));
      } else {
        Fluttertoast.showToast(
            msg: "Fail to create".toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }
}
