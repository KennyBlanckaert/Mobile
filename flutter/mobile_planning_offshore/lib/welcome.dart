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
      // ---> Background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue[200], Colors.blue[800]] // #FF4FC3F7 -> #FF64B5F6
          )
        ),
        // ---> Centered Column Container
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "WELCOME",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    height: 3
                  )
                ),
                Text(
                  "We're super glad to have you on board.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x77EEEEEE),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  )
                ),
                Text(
                  "Are you ready to depart?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x77EEEEEE),
                    fontFamily: 'Roboto',
                    fontSize: 14,
                  )
                ),
                SizedBox(height: 80),
                RaisedButton(
                  color: Color(0xFFFFFFFF),
                  child: Text(
                    "LET'S START",
                    style: TextStyle(
                      color: Color(0xFF64B5F6)
                    )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {},
                )
              ]
            )
          )
        )
      )
    );
  }
}
