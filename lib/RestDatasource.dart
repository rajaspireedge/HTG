import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network_util.dart';
import 'user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://157.245.97.187:9090";
  static final Signup = BASE_URL + "/v1/user/register";
  static final SIGNUPURL = BASE_URL + "/v1/user/signin";
  static final Contest = BASE_URL + "/v1/contest";

  addStringToSF(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', data["_id"]);
  }

  Future<User> login(String username, String password) {
    return _netUtil.post(SIGNUPURL,
        body: {"Mobile": username, "Password": password}).then((dynamic res) {
      if (res["Status"] == "Success") {
        addStringToSF(res["Data"]);
      }
      if (res["Status"] == "Failure") {
        var Error = res["Error"];
        Fluttertoast.showToast(
            msg: Error["Message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
        throw new Exception(res);
      }
      return new User.map(res["Data"]);
    });
  }

  Future<User> signup(String FirstName, String LastName, String Email,
      String Mobile, String Password) {
    return _netUtil.post(Signup, body: {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
      "Mobile": Mobile,
      "Password": Password,
    }).then((dynamic res) {
      if (res["Status"] == "Failure") {
        var Error = res["Error"];
        Fluttertoast.showToast(
            msg: Error["Message"].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white);
        throw new Exception(res);
      }
      return;
    });
  }
}
