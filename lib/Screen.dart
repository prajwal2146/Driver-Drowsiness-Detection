import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vivify/Authentication/Authentication.dart';
import 'package:vivify/FaceDetection/FaceDetection.dart';
import 'package:vivify/Map/home.dart';
import 'package:vivify/SOS/fightBack.dart';
import 'package:vivify/SOS/helplineNumbers.dart';
import 'package:vivify/SOS/SOS.dart';
import 'package:vivify/SOS/reportCrime.dart';
import 'package:vivify/SOS/BecomeSafeguide.dart';
import 'Custom Button.dart';

class Methods extends StatefulWidget {
  Methods({this.auth, this.onSignedOut});
  final AuthImplementation auth;
  final VoidCallback onSignedOut;
  @override
  _MethodsState createState() => _MethodsState();
}

class _MethodsState extends State<Methods> {
  void _logout() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        getLocation();
      }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FightBack()),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelplineNumbers()),
        );
      }
      if (index == 3) {
        reportCrime();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          brightness: Brightness.light,
          title: Text(
            'Vivify',
            style: TextStyle(fontSize: 30.0,color:Colors.black87, fontFamily: "Satisfy", ),
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: _logout,
              icon: Icon(Icons.exit_to_app),
              label: Text("Logout",
                  style: TextStyle(
                      fontFamily: "Quando",
                      fontSize: 18.0,
                      color: Colors.black)),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('Images/Cover4.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 25.0,),
                    CustomButton(heading:'Map',function: MyHomePage(),icon: 'Images/Map.png',),
                      CustomButton(heading: 'Vivify',function: FaceDetection(),icon: 'Images/Eye.png',),
                      CustomButton(heading: 'Register User',function: BecomeSafeguide(),icon: 'Images/User.png',),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal[100],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.announcement,size: 25,
                color: Colors.redAccent,
              ),
              title: Text(
                'SOS',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.redAccent,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.reply,
                size: 25,
                color: Colors.lightBlue,
              ),
              title: Text(
                'Learn',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlue,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                color: Colors.yellow,
                size: 25,
              ),
              title: Text(
                'Helpline',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.yellow,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.report,
                color: Colors.green,
                size: 25,
              ),
              title: Text(
                'Report',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18
                ),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
