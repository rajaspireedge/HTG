import 'package:flutter/material.dart';
import 'package:htg/HomeScreen.dart';
import 'package:htg/RestDatasource.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateContest extends StatefulWidget {
  @override
  _CreateContestState createState() => _CreateContestState();
}

class _CreateContestState extends State<CreateContest> {
  @override
  Widget build(BuildContext context) {
    final fullname_controller = TextEditingController();
    final emailtext_controller = TextEditingController();
    final mobilenumbertext_controller = TextEditingController();
    final passwordFields_controller = TextEditingController();

    final signuptext = new InkWell(
      child: Text("Sign Up",
          style: TextStyle(
              fontFamily: 'Muli',
              fontSize: 20.0,
              color: Color(0xFFEE802E),
              fontWeight: FontWeight.bold)),
    );

    final fullnametext = TextField(
      controller: fullname_controller,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Muli', fontSize: 16.0, color: Color(0xFFEE802E)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Full name",
        hintStyle:
            TextStyle(fontFamily: 'Muli', fontSize: 16.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color(0xFFEE802E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );

    final emailtext = TextField(
      controller: emailtext_controller,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Muli', fontSize: 16.0, color: Color(0xFFEE802E)),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        hintStyle:
            TextStyle(fontFamily: 'Muli', fontSize: 16.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color(0xFFEE802E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );

    RestDatasource api = new RestDatasource();

    final Havearefferealcodetext = Text("Have a Reffral Code?",
        style: TextStyle(
            fontFamily: 'Muli', fontSize: 14.0, color: Color(0xFFEE802E)));

    final mobilenumbertext = TextField(
      controller: mobilenumbertext_controller,
      obscureText: false,
      maxLength: 10,
      style: TextStyle(
          fontFamily: 'Muli', fontSize: 16.0, color: Color(0xFFEE802E)),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        counter: Offstage(),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Mobile no.",
        hintStyle:
            TextStyle(fontFamily: 'Muli', fontSize: 16.0, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Color(0xFFEE802E)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );

    final alreadyhaveacount = Text("Already have an account?",
        style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.bold));

    final signintext = new InkWell(
        onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen())),
        child: Text("Sign In",
            style: TextStyle(
                fontFamily: 'Muli',
                fontSize: 14.0,
                color: Color(0xFFEE802E),
                fontWeight: FontWeight.bold)));

    Map<String, dynamic> apimap = Map();

    final passwordFields = TextField(
      controller: passwordFields_controller,
      obscureText: true,
      style: TextStyle(
          fontFamily: 'Muli', fontSize: 16.0, color: Color(0xFFEE802E)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle:
              TextStyle(fontFamily: 'Muli', fontSize: 16.0, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFFEE802E)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.green),
          )),
    );

    return Scaffold(
      body: WillPopScope(
        child: new Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image(image: AssetImage('assets/images/LOGO.png')),
                      height: 100,
                      width: 100,
                    ),
                    signuptext,
                    SizedBox(height: 10.0),
                    fullnametext,
                    SizedBox(height: 10.0),
                    emailtext,
                    SizedBox(height: 10.0),
                    mobilenumbertext,
                    SizedBox(height: 10.0),
                    passwordFields,
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () {
                        print(emailtext_controller.text);
                        apimap["FirstName"] = fullname_controller.text;
                        apimap["LastName"] = fullname_controller.text;
                        apimap["Email"] = emailtext_controller.text;
                        apimap["Mobile"] = mobilenumbertext_controller.text;
                        apimap["Password"] = passwordFields_controller.text;
                        api.signup(apimap, context);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        child:
                            Image(image: AssetImage('assets/images/Next.png')),
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFEE802E)),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            child: alreadyhaveacount,
                          ),
                          new Container(
                            child: signintext,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Havearefferealcodetext
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()));
        },
      ),
    );
  }
}
