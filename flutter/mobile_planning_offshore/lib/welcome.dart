import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

			// ---> Page
			body: Container(

				// ---> Background
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.topCenter,
						end: Alignment.bottomCenter,
						colors: [Color(0xFF81D4FA), Color(0xFF1565C0)]
					)
				),

				// ---> Centered Column Container
				child: Center(
					child: Container(
						child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>[

								// ---> Margin
								SizedBox(height: 20),

								// ---> Logo
								Container(
									width: 60,
									height: 60,
									child: SvgPicture.asset('images/wind-turbine-white.svg')
								),

								// ---> Margin
								SizedBox(height: 50),

								// ---> TextBox 1
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
								
								// ---> TextBox 2
								Text(
									"We're super glad to have you on board.",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Color(0x77EEEEEE),
										fontFamily: 'Roboto',
										fontSize: 14,
										height: 1.2
									)
								),
								
								// ---> TextBox 3
								Text(
									"This will be a great adventure!",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Color(0x77EEEEEE),
										fontFamily: 'Roboto',
										fontSize: 14,
										height: 1.2
									)
								),
								
								// ---> TextBox 4
								Text(
									"Are you ready to depart?",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Color(0x77EEEEEE),
										fontFamily: 'Roboto',
										fontSize: 14,
										height: 1.2
									)
								),

								// ---> Margin
								SizedBox(height: 80),

								// ---> Button
								Container(
									width: 150,
									height: 40,
									child: RaisedButton(
										color: Color(0xFFFFFFFF),
										child: Text(
											"LET'S START",
											style: TextStyle(
												color: Color(0xFF64B5F6)
											)
										),
										elevation: 4,
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(20),
										),
										onPressed: () {
											debugPrint("Start");
										}
									)
								)
							]
						)
					)
				)
			)
		);
  	}
}
