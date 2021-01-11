import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/creatingandjoin.dart';
import 'package:htg/screens/Tabscreen3.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Creategame extends StatefulWidget {
  @override
  _CreategameState createState() => _CreategameState();
}

class _CreategameState extends State<Creategame> {
  var entergamename = TextEditingController();
  var enterentryfeeamount = TextEditingController();
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
  bool status = false;
  bool isChecked = false;
  bool isChecked2 = false;

  var _mySelection;
  List snapgetrules = List();

  File uploadimage;

  String uploadimageString;

  var selectedDate;

  var DateFormat;

  var selectedTime;

  String _hour;

  String _minute;

  String _time;

  var hh;

  Future<String> getRules() async {
    var res = await http.get(Uri.encodeFull(RestDatasource.rule), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    var resBody = json.decode(res.body);
    print(res.body);

    setState(() {
      snapgetrules = resBody["Data"];
    });

    return "Success";
  }

  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage;
      uploadimageString = uploadimage.path.toString();
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        gamedate.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        gametime.text = _time;
      });
  }

  @override
  void initState() {
    super.initState();
    this.getRules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFEE802E),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create Contest',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.0, color: Colors.white, fontFamily: 'Muli'),
              ),
            ],
          )),
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
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
                    color: Color(0xFFEE802E),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: entergamename,
                  obscureText: false,
                  style: TextStyle(
                      fontFamily: 'Muli-Regular',
                      fontSize: 14.0,
                      color: Color(0xFFEE802E)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Enter game name",
                    counter: Offstage(),
                    hintStyle: TextStyle(
                        fontFamily: 'Muli-Regular',
                        fontSize: 14.0,
                        color: Color(0xFFEE802E)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Color(0xFFEE802E)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: TextField(
                  controller: entercreatorname,
                  obscureText: false,
                  style: TextStyle(
                      fontFamily: 'Muli-Regular',
                      fontSize: 14.0,
                      color: Color(0xFFEE802E)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Enter creator name",
                    counter: Offstage(),
                    hintStyle: TextStyle(
                        fontFamily: 'Muli-Regular',
                        fontSize: 14.0,
                        color: Color(0xFFEE802E)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Color(0xFFEE802E)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _selectTime(context);
                        },
                    child: Container(
                        margin: EdgeInsets.only(left: 20, right: 5),
                        child: TextField(
                          controller: gametime,
                          obscureText: false,
                          style: TextStyle(
                              fontFamily: 'Muli-Regular',
                              fontSize: 14.0,
                              color: Color(0xFFEE802E)),
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.access_time_outlined,
                              color: Color(0xFFEE802E),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Game time",
                            counter: Offstage(),
                            hintStyle: TextStyle(
                                fontFamily: 'Muli-Regular',
                                fontSize: 14.0,
                                color: Color(0xFFEE802E)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Color(0xFFEE802E)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                        )),
                  )),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 5, right: 20),
                          child: TextField(
                            controller: gamedate,
                            obscureText: false,
                            style: TextStyle(
                                fontFamily: 'Muli-Regular',
                                fontSize: 14.0,
                                color: Color(0xFFEE802E)),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFFEE802E),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Game date",
                              counter: Offstage(),
                              hintStyle: TextStyle(
                                  fontFamily: 'Muli-Regular',
                                  fontSize: 14.0,
                                  color: Color(0xFFEE802E)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide:
                                    BorderSide(color: Color(0xFFEE802E)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          )))
                ],
              ),
              Container(
                  height: 100,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFEE802E))),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: TextField(
                            style: TextStyle(
                                fontFamily: 'Muli-Regular',
                                fontSize: 14.0,
                                color: Color(0xFFEE802E)),
                            controller: gamedescription,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.edit,
                                color: Color(0xFFEE802E),
                              ),
                              contentPadding: EdgeInsets.all(18),
                              hintText: "Description",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontFamily: 'Muli-Regular',
                                  fontSize: 14.0,
                                  color: Color(0xFFEE802E)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 20, right: 5),
                            child: Text("Generate no. Auto",
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 10.0,
                                    color: Color(0xFFEE802E),
                                    fontWeight: FontWeight.bold))),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                child: CustomSwitchButton(
                                  backgroundColor: Colors.black12,
                                  unCheckedColor: Color(0xFFEE802E),
                                  animationDuration:
                                      Duration(milliseconds: 100),
                                  checkedColor: Colors.white,
                                  checked: isChecked,
                                ),
                              ),
                            )),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: Text("Multiple Win. Allow",
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 10.0,
                                    color: Color(0xFFEE802E),
                                    fontWeight: FontWeight.bold))),
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 20),
                            child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isChecked2 = !isChecked2;
                                  });
                                },
                                child: CustomSwitchButton(
                                  backgroundColor: Colors.black12,
                                  unCheckedColor: Color(0xFFEE802E),
                                  animationDuration:
                                      Duration(milliseconds: 100),
                                  checkedColor: Colors.white,
                                  checked: isChecked2,
                                ),
                              ),
                            )),
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 20, right: 5),
                            child: TextField(
                              controller: totalplayers,
                              obscureText: false,
                              style: TextStyle(
                                  fontFamily: 'Muli-Regular',
                                  fontSize: 14.0,
                                  color: Color(0xFFEE802E)),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Total Players",
                                counter: Offstage(),
                                hintStyle: TextStyle(
                                    fontFamily: 'Muli-Regular',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFFEE802E)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            ))),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 5, right: 20),
                            child: TextField(
                              controller: totalamount,
                              obscureText: false,
                              style: TextStyle(
                                  fontFamily: 'Muli-Regular',
                                  fontSize: 14.0,
                                  color: Color(0xFFEE802E)),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Total amount",
                                counter: Offstage(),
                                hintStyle: TextStyle(
                                    fontFamily: 'Muli-Regular',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xFFEE802E)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              ),
                            )))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: TextField(
                  controller: enterentryfeeamount,
                  obscureText: false,
                  style: TextStyle(
                      fontFamily: 'Muli-Regular',
                      fontSize: 14.0,
                      color: Color(0xFFEE802E)),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Enter entry fee Amount",
                    counter: Offstage(),
                    hintStyle: TextStyle(
                        fontFamily: 'Muli-Regular',
                        fontSize: 14.0,
                        color: Color(0xFFEE802E)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Color(0xFFEE802E)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          border: Border.all(color: Color(0xFFEE802E))),
                      margin: EdgeInsets.only(right: 20.0, left: 20, top: 20),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconSize: 25.0,
                            icon: Icon(
                              Icons.arrow_circle_down_sharp,
                              color: Color(0xFFEE802E),
                            ),
                            hint: Text(
                              "Get Rules",
                              style: TextStyle(
                                  fontFamily: 'Muli-Regular',
                                  fontSize: 14.0,
                                  color: Color(0xFFEE802E)),
                            ),
                            isExpanded: true,
                            style: TextStyle(
                                fontFamily: 'Muli-Regular',
                                fontSize: 14.0,
                                color: Color(0xFFEE802E)),
                            value: _mySelection,
                            onChanged: (newVal) {
                              setState(() {
                                _mySelection = newVal;
                              });
                            },
                            items: snapgetrules.map((item) {
                              return DropdownMenuItem(
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: new Text(
                                    item['RuleName'],
                                    style: TextStyle(
                                        fontFamily: 'Muli-Regular',
                                        fontSize: 14.0,
                                        color: Color(0xFFEE802E)),
                                  ),
                                ),
                                value: item['_id'],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 5),
                                  child: TextField(
                                    controller: totalplayers,
                                    obscureText: false,
                                    style: TextStyle(
                                        fontFamily: 'Muli-Regular',
                                        fontSize: 14.0,
                                        color: Color(0xFFEE802E)),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      hintText: "Total Players",
                                      counter: Offstage(),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Muli-Regular',
                                          fontSize: 14.0,
                                          color: Color(0xFFEE802E)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFEE802E)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                    ),
                                  ))),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 5, right: 20),
                                  child: TextField(
                                    controller: totalamount,
                                    obscureText: false,
                                    style: TextStyle(
                                        fontFamily: 'Muli-Regular',
                                        fontSize: 14.0,
                                        color: Color(0xFFEE802E)),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      hintText: "Total amount",
                                      counter: Offstage(),
                                      hintStyle: TextStyle(
                                          fontFamily: 'Muli-Regular',
                                          fontSize: 14.0,
                                          color: Color(0xFFEE802E)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFEE802E)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("Add Rule",
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E),
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text("Remove",
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(color: Colors.grey)),
              ),
              SizedBox(
                child: GestureDetector(
                    child: Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFEE802E),
                      borderRadius: new BorderRadius.circular(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10.0),
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: Text("Submit",
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
        ),
        onWillPop: () async {
          return Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => CreateAndJoin()));
        },
      ),
    );
  }
}
