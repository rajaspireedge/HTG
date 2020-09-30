import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htg/CreateContest.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/creatingandjoin.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle style = TextStyle(
      fontFamily: 'Poppins-Regular', fontSize: 10.0, color: Colors.orange);
 TextStyle hintstyle = TextStyle(
      fontFamily: 'Poppins-Regular', fontSize: 10.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    final username_controller = TextEditingController();

    final password_controller = TextEditingController();

    final signintext = Text("Sign In",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.0,
            color: Colors.orange,
            fontWeight: FontWeight.bold));
    final ORloginintext = Text("OR Login via",
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 15.0, color: Colors.orange));

    final Havearefferealcodetext = Text("Have a Reffral\nCode?",
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 10.0, color: Colors.orange));

    final donthaveaccounttext = Text("Don't have an\naccount?Sign Up",
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 10.0, color: Colors.orange));

    final forgotpasswordtext = Text("forgot password?",
        style: TextStyle(
            fontFamily: 'Poppins', fontSize: 10.0, color: Colors.grey));

    const border = Border(
      top: BorderSide(width: 1.0, color: Colors.orange),
      left: BorderSide(width: 1.0, color: Colors.orange),
      right: BorderSide(width: 1.0, color: Colors.brown),
      bottom: BorderSide(width: 1.0, color: Colors.brown),
    );

    final emailFields = TextField(
      controller: username_controller,
      obscureText: false,
      style: style,
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Mobile",
        counter: Offstage(),
        hintStyle: hintstyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.orange),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );

    RestDatasource api = new RestDatasource();

    final passwordFields = TextField(
      controller: password_controller,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle: hintstyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.orange),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.green),
          )),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  signintext,
                  SizedBox(height: 10.0),
                  Container(child: emailFields),
                  SizedBox(height: 10.0),
                  Container(child: passwordFields),
                  SizedBox(height: 10.0),
                  Container(child: forgotpasswordtext),
                  Container(
                    width: 60,
                    height: 60,
                    child: InkWell(
                      onTap: () => api
                          .login(username_controller.text,
                              password_controller.text)
                          .then((value) => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  CreateAndJoin()))),
                    ),
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                  ),
                  ORloginintext,
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(border: border),
                            child: Text("Facebook",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                    color: Colors.grey))),
                        new Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(border: border),
                            child: Text("Google",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                    color: Colors.grey)))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Havearefferealcodetext,
                        ),
                        new InkWell(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CreateContest())),
                          child: donthaveaccounttext,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
