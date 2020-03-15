import 'package:flutter/material.dart';

// Welcome widget
class Welcome extends StatefulWidget {
  Welcome({Key key}) 
    : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

// Welcome state
class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[200], Colors.blue[800]] // #FF4FC3F7 -> #FF64B5F6
          )
        ),
        child: Center(
          child: Text(
            "WELCOME",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Roboto',
              fontSize: 14,
            )
          )
        )
      )
    );
  }
}
