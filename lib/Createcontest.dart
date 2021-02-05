import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/TabMaker.dart';
import 'package:htg/screens/CreateandJoinGame.dart';
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
  String gametime = "Game time";
  var gamename = TextEditingController();
  String gamedate = "Game date";
  var gamedescription = TextEditingController();
  var totalplayers = TextEditingController();
  var totalamount = TextEditingController();
  var entryfeeamount = TextEditingController();
  var gamerules = TextEditingController();
  var winneramount = TextEditingController();
  var totalwinner = TextEditingController();
  var addnewrules = TextEditingController();
  bool status = false;
  bool isChecked = false;
  bool isChecked2 = false;
  RestDatasource api = new RestDatasource();

  var _mySelection;
  List snapgetrules = List();

  File uploadimage;

  String uploadimageString;

  var DateFormat;

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime _selectDate;
  Map<String, dynamic> map = Map();
  Map<String, dynamic> apimap = Map();

  TextStyle styleorange = TextStyle(fontFamily: 'Muli-Regular', fontSize: 14.0);

  Future<String> getRules() async {
    var res = await http.get(Uri.encodeFull(RestDatasource.rule), headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    var resBody = json.decode(res.body);

    setState(() {
      snapgetrules = resBody["Data"];
      print(snapgetrules);
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

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),

      //which date will display when user open the picker
      firstDate: DateTime(1950),
      //what will be the previous supported year in picker
      lastDate: DateTime(2100),
    ) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectDate = pickedDate;

        gamedate = formatDate(
            DateTime(_selectDate.year, _selectDate.month, _selectDate.day),
            [dd, '/', mm, '/', yyyy]);
      });
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
        gametime = selectedTime.format(context).toString();
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
        backgroundColor: Color(0xFFEE802E),
      ),
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEE802E)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        margin: EdgeInsets.only(left: 20, right: 5),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                gametime,
                                style: TextStyle(
                                    fontFamily: 'Muli-Regular',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E)),
                              ),
                              Icon(
                                Icons.access_time,
                                color: Color(0xFFEE802E),
                              )
                            ],
                          ),
                        )),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      _pickDateDialog();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEE802E)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        margin: EdgeInsets.only(left: 5, right: 20),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                gamedate,
                                style: TextStyle(
                                    fontFamily: 'Muli-Regular',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E)),
                              ),
                              Icon(
                                Icons.calendar_today,
                                color: Color(0xFFEE802E),
                              )
                            ],
                          ),
                        )),
                  )),
                ],
              ),
              Container(
                  height: 100,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
                              keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
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
                            hint: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "Get Rules",
                                style: TextStyle(
                                    fontFamily: 'Muli-Regular',
                                    fontSize: 14.0,
                                    color: Color(0xFFEE802E)),
                              ),
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
                              map["RuleId"] = item["_id"];
                              map["Price"] = "10";
                              map["Quantity"] = "1";

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
                                    controller: winneramount,
                                    obscureText: false,
                                    style: TextStyle(
                                        fontFamily: 'Muli-Regular',
                                        fontSize: 14.0,
                                        color: Color(0xFFEE802E)),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      hintText: "Winner amount",
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
                                    controller: totalwinner,
                                    obscureText: false,
                                    style: TextStyle(
                                        fontFamily: 'Muli-Regular',
                                        fontSize: 14.0,
                                        color: Color(0xFFEE802E)),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 15.0, 20.0, 15.0),
                                      hintText: "Total Winners",
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
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      //this right here
                                      child: Container(
                                        height: 200,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(
                                                        "Add new rules",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: 'Muli',
                                                            letterSpacing: 0.03,
                                                            fontSize: 18.0,
                                                            color: Color(
                                                                0xFFEE802E)),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10),
                                                        child: Icon(
                                                          Icons.close,
                                                          color:
                                                              Color(0xFFEE802E),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: TextField(
                                                controller: addnewrules,
                                                obscureText: false,
                                                style: TextStyle(
                                                    fontFamily: 'Muli-Regular',
                                                    fontSize: 14.0,
                                                    color: Color(0xFFEE802E)),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(20.0,
                                                          15.0, 20.0, 15.0),
                                                  hintText: "Add rule",
                                                  counter: Offstage(),
                                                  hintStyle: TextStyle(
                                                      fontFamily:
                                                          'Muli-Regular',
                                                      fontSize: 14.0,
                                                      color: Color(0xFFEE802E)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFEE802E)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)),
                                                    borderSide: BorderSide(
                                                        color: Colors.green),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: GestureDetector(
                                                  child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    bottom: 20),
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFEE802E),
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(40)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                10.0,
                                                                0.0,
                                                                0.0,
                                                                0.0),
                                                        child: Text("Add",
                                                            style: new TextStyle(
                                                                fontSize: 10.0,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Muli'))),
                                                  ],
                                                ),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text("Add Rule",
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontSize: 14.0,
                                      color: Color(0xFFEE802E),
                                      fontWeight: FontWeight.bold)),
                            ),
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
                    onTap: () {
                      String time = formatDate(
                          DateTime(
                            _selectDate.year,
                            _selectDate.month,
                            _selectDate.day,
                            selectedTime.hourOfPeriod,
                            selectedTime.minute,
                          ),
                          [
                            dd,
                            '/',
                            mm,
                            '/',
                            yyyy,
                            ' ',
                            HH,
                            ':',
                            nn,
                            ':',
                            ss,
                            ' ',
                            am
                          ]);

                      List rules = [];

                      rules.add(map);

                      apimap["ContestName"] = entergamename.text;
                      apimap["TicketPrice"] = enterentryfeeamount.text;
                      apimap["StartTime"] = time;
                      apimap["EndTime"] = time;
                      apimap["MaxPlayers"] = totalplayers.text;
                      apimap["NumberGenerateAuto"] = isChecked;
                      apimap["NumberGenerateDuration"] = 10;
                      apimap["Rules"] = rules;

                      api.getStringValuesSF().then(
                          (value) => {api.postHttp(apimap, value, context)});

                      /*  api.getStringValuesSF().then((value) => {
                            api
                                .createcontest(
                                    entergamename.text,
                                    enterentryfeeamount.text,
                                    time,
                                    "20/01/2021 06:24:00 AM",
                                    totalplayers.text,
                                    isChecked.toString(),
                                    10,
                                    rules,
                                    value)
                                .then((value) => print(value))
                          });*/
                    },
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
