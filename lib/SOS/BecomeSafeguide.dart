import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BecomeSafeguide extends StatelessWidget {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Center(child: Text('Become a Safeguide',style: TextStyle(fontSize: 30.0,color:Colors.black87, fontFamily: "Satisfy",),)),
      ),
      backgroundColor: Colors.lightBlueAccent[200],
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('Images/Cover.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 200, 20, 100),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Center(
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
                Center(
                  child: Text(
                    'Enter User Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly,
                  ],
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Enter a email address',
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_on),
                    hintText: 'Enter area',
                    labelText: 'Location',
                  ),
                ),
                new Container(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(
                    splashColor: Colors.grey,
                    color: Colors.lightGreenAccent,
                    onPressed: () {
                      _displaySnackBar(context);
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    highlightElevation: 20.0,
                    highlightColor: Colors.white,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar =
        SnackBar(content: Text('Details Saved Succesfully.'));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
