import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.heading, @required this.function, @required this.icon});
  final String heading;
  final Widget function;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return function;
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Material(
          color: Colors.indigoAccent,
          elevation: 40.0,
          shadowColor: Colors.black,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(50,5, 50, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(200.0),
                    child: Container(
                      height: 180.0,
                      width: 180.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            icon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    heading,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                      color: Colors.black45,
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
}
