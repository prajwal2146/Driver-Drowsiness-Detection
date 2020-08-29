import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:vivify/Authentication/LoginPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  String email;
  String password;
  String errorMsg;
  bool _obscureText = true;
  Future<void> _showDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mail Is Sent To Your Email'),
          content: const Text('Please Confirm Your EmailID'),
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

  _showDialog1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: const Text('User Registered'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<Void> _showDialog2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: const Text('Email or Password field is Empty'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('Images/Cover3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('Images/Vivify.png'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
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
              TextField(
                controller: _passwordController,
                style: TextStyle(fontSize: 18.0),
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  suffixIcon:  IconButton(
                    icon: Icon(_obscureText ? Icons.lock_open :Icons.lock_outline),
                    onPressed: _toggle,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "Quando",
                      color: Colors.blueAccent),
                  icon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    splashColor: Colors.grey,
                    color: Color(0xFF64DD03),
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        _showDialog2(context);
                      }
                      FirebaseUser user ;
                      if (user == null) {
                        try {
                         user = (await _firebaseAuth.createUserWithEmailAndPassword(
                             email: email, password: password)) as FirebaseUser;
                          await user.sendEmailVerification();
                          _showDialog(context);
                        }
                        catch (e) {
                          _showDialog1(context);
                        }
                      }
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(30.0),
                    ),
                    highlightElevation: 20.0,
                    highlightColor: Colors.white,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  RaisedButton(
                    splashColor: Colors.grey,
                    color: Colors.lightBlueAccent[200],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    highlightElevation: 20.0,
                    highlightColor: Colors.white,
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
