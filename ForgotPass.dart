import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email;
  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: const Text('Reset Password Link Is Sent To Your Email_ID'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        brightness: Brightness.light,
        title: Center(
          child: Text(
            'Reset Password',textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35.0,color:Colors.black87, fontFamily: "Satisfy", ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('Images/Cover5.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image(
                image: AssetImage('Images/Vivify.png'),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(fontSize: 18.0),
                onChanged: (value) {
                  email = value;
                },
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                splashColor: Colors.grey,
                onPressed: () {
                  _auth.sendPasswordResetEmail(email: email);
                  throw _showDialog(context);
                },
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  'CONFIRM',
                  style: TextStyle(
                      fontFamily: "Quando",
                      fontSize: 20.0,
                      color: Colors.black),
                ),
                color: Colors.greenAccent[700],
              ),
            ],
          ),
        ),
    );
  }
}
