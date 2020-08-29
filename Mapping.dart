import 'package:flutter/material.dart';
import 'package:vivify/Authentication/LoginPage.dart';
import 'package:vivify/Authentication/Authentication.dart';
import 'package:vivify/Screen.dart';

class MappingPage extends StatefulWidget {
  final AuthImplementation auth;

  MappingPage({this.auth});

  State<StatefulWidget> createState() {
    return _MappingPageState();
  }
}

enum AuthStatus { notSignedIn, signedIn }

class _MappingPageState extends State<MappingPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((firebaseUserID) {
      setState(() {
        authStatus = firebaseUserID == null
            ? AuthStatus.notSignedIn
            : AuthStatus.signedIn;
      });
    });
  }

  void _signIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(auth: widget.auth, onSignedIn: _signIn);
      case AuthStatus.signedIn:
        return Methods(auth: widget.auth, onSignedOut: _signOut);
    }
    return null;
  }
}
