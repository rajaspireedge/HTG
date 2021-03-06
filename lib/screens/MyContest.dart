import 'package:flutter/material.dart';
import 'package:htg/mycontestscreens/completed.dart';
import 'package:htg/mycontestscreens/recent.dart';
import 'package:htg/mycontestscreens/upcoming.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> with AutomaticKeepAliveClientMixin<Tab2> {
  int tabIndex = 0;
  List<Widget> listScreens;

  TextStyle style = TextStyle(
      fontFamily: 'Muli-Regular', fontSize: 14.0, color: Colors.white);

  TextStyle styleorange = TextStyle(fontFamily: 'Muli-Regular', fontSize: 14.0);

  @override
  void initState() {
    super.initState();
    listScreens = [Recent(), Upcoming(), Completed()];
  }

  @override
  Widget build(BuildContext context) {
    print('build Tab2');
    return MaterialApp(
      color: Color(0xFFEE802E),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
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
                      'My Contest',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: 'Muli'),
                    ),
                  ),
                ],
              ),
              backgroundColor: Color(0xFFEE802E),
              bottom: TabBar(
                  indicatorColor: Color(0xFFEE802E),
                  unselectedLabelColor: Colors.white,
                  labelColor: Color(0xFFEE802E),
                  indicator: BoxDecoration(color: Colors.white),
                  tabs: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          "Recent",
                          style: styleorange,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: styleorange,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 40,
                      child: Center(
                        child: Text(
                          "Completed",
                          style: styleorange,
                        ),
                      ),
                    ),
                  ]),
            ),
            body: TabBarView(children: [Recent(), Upcoming(), Completed()]),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
