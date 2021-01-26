import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htg/SignUp.dart';
import 'package:htg/RestDatasource.dart';
import 'package:htg/TabMaker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final username_controller = TextEditingController();
    final password_controller = TextEditingController();

    final signintext = Text("Sign In",
        style: TextStyle(
            fontFamily: 'Muli',
            fontSize: 25.0,
            color: Color(0xFFEE802E),
            fontWeight: FontWeight.bold));
    final ORloginintext = Text("OR Login via",
        style: TextStyle(
            fontFamily: 'Muli', fontSize: 20.0, color: Color(0xFFEE802E)));

    final Havearefferealcodetext = Text("Have a Reffral\nCode?",
        style: TextStyle(
            fontFamily: 'Muli', fontSize: 14.0, color: Color(0xFFEE802E)));

    final donthaveaccounttext = Text("Don't have an\naccount?Sign Up",
        style: TextStyle(
            fontFamily: 'Muli', fontSize: 14.0, color: Color(0xFFEE802E)));

    final forgotpasswordtext = Text("forgot password?",
        style:
            TextStyle(fontFamily: 'Muli', fontSize: 14.0, color: Colors.grey));

    const border = Border(
      top: BorderSide(width: 1.0, color: Color(0xFFEE802E)),
      left: BorderSide(width: 1.0, color: Color(0xFFEE802E)),
      right: BorderSide(width: 1.0, color: Colors.brown),
      bottom: BorderSide(width: 1.0, color: Colors.brown),
    );

    Map<String, dynamic> apimap = Map();

    final emailFields = TextField(
      controller: username_controller,
      obscureText: false,
      style: TextStyle(
          fontFamily: 'Muli-Regular', fontSize: 16.0, color: Color(0xFFEE802E)),
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Mobile",
        counter: Offstage(),
        hintStyle: TextStyle(fontFamily: 'Muli-Regular', fontSize: 16.0, color: Colors.grey),
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

    final passwordFields = TextField(
      controller: password_controller,
      obscureText: true,
      style: TextStyle(
          fontFamily: 'Muli-Regular', fontSize: 16.0, color: Color(0xFFEE802E)),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          hintStyle: TextStyle(fontFamily: 'Muli-Regular', fontSize: 16.0, color: Colors.grey),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(child: Image(image: AssetImage('assets/images/LOGO.png')), height: 200,width: 200,),

                  signintext,
                  SizedBox(height: 10.0),
                  Container(child: emailFields),
                  SizedBox(height: 10.0),
                  Container(child: passwordFields),
                  SizedBox(height: 10.0),
                  Container(child: forgotpasswordtext),
                  GestureDetector(
                    child: Container(
                      width: 60,
                      height: 60,
                      child: Image(image: AssetImage('assets/images/Next.png')),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFEE802E)),
                    ),
                    onTap: () {
                      apimap["Mobile"] = username_controller.text;
                      apimap["Password"] = password_controller.text;
                      api.loginapi(apimap, context);
                    },
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
                                    fontFamily: 'Muli',
                                    fontSize: 14.0,
                                    color: Colors.grey))),
                        new Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            decoration: BoxDecoration(border: border),
                            child: Text("Google",
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 14.0,
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
