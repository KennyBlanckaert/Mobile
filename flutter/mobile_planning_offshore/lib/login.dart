import 'package:flutter/material.dart';
import 'dashboard.dart';

// Login widget
class Login extends StatefulWidget {
  	Login({Key key}) 
    : super(key: key);

	@override
	_LoginState createState() => _LoginState();
}

// Login state
class _LoginState extends State<Login> {

	Future navigateToDashboard(context) async {
	Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
	}

  	@override
  	Widget build(BuildContext context) {

		return Scaffold(

			// ---> Body
			body: Container(
				width: MediaQuery.of(context).size.width,
				height: MediaQuery.of(context).size.height,

				// ---> Background
				decoration: BoxDecoration(
					gradient: LinearGradient(
						begin: Alignment.topCenter,
						end: Alignment.bottomCenter,
						colors: [Colors.lightBlue[200], Colors.blue[800]]
					)
				),

				// ---> Content
				child: Column(
					children: <Widget>[

						// ---> Margin
						SizedBox(height: 220),

						// ----> Username
						Material(
							elevation: 4,
							shadowColor: Colors.blue,
							borderRadius: BorderRadius.all(Radius.circular(30.0)),
							child: Container(
								width: MediaQuery.of(context).size.width - 60,
								height: 40,
								child: TextField(
									decoration: InputDecoration(
										filled: true,
										fillColor: Colors.white,
										prefixIcon: GradientMask(
											child: Icon(Icons.person_outline, size: 20, color: Colors.white)
										),
										hintText: 'Username',
										hintStyle: TextStyle(color: Color(0xEEAAAAAA), height: 2.9),
										border: OutlineInputBorder(
											borderRadius: BorderRadius.all(Radius.circular(30.0)),
											borderSide: BorderSide(
												width: 0, 
												style: BorderStyle.none
											)
										),
									)
								)
							)
						),

						// ---> Margin
						SizedBox(height: 25),

						// ---> Password
						Material(
							elevation: 4,
							shadowColor: Colors.blue,
							borderRadius: BorderRadius.all(Radius.circular(30.0)),
							child: Container(
								width: MediaQuery.of(context).size.width - 60,
								height: 40,
								child: TextField(
									obscureText: true,
									decoration: InputDecoration(
										filled: true,
										fillColor: Colors.white,
										prefixIcon: GradientMask(
											child: Icon(Icons.lock_outline, size: 20, color: Colors.white)
										),
										hintText: 'Password',
										hintStyle: TextStyle(color: Color(0xEEAAAAAA), height: 2.9),
										border: OutlineInputBorder(
											borderRadius: BorderRadius.all(Radius.circular(30.0)),
											borderSide: BorderSide(
												width: 0, 
												style: BorderStyle.none
											)
										)
									)
								)
							)
						),

						// ---> Margin
						SizedBox(height: 25),

						// ---> Button
						Container(
							width: 150,
							height: 40,
							child: RaisedButton(
								color: Color(0xFFFFFFFF),
								child: Text(
									"LOG IN",
									style: TextStyle(
										color: Color(0xFF64B5F6)
									)
								),
								elevation: 4,
								shape: RoundedRectangleBorder(
									borderRadius: BorderRadius.circular(20),
								),
								onPressed: () {
									navigateToDashboard(context);
								}
							)
						),

						// ---> Margin
						SizedBox(height: 25),


						// ---> Caption
						Center(
							child: Column(	
								children: <Widget>[
									Text(
										"Don't have an account?",
										style: TextStyle(color: Color(0xAADDDDDD))
									),
									SizedBox(height: 5),
									GestureDetector(
										onTap:() { 
											debugPrint("Sign up");
										},
										child: Text(										
											"Sign up",
											style: TextStyle(color: Colors.lightBlue[400], fontWeight: FontWeight.bold)
										)
									)
								]
							)
						),
					]
				)
			)
		);
  	}
}

// Helpers
class GradientMask extends StatelessWidget {
  	final Widget child;
  
  	GradientMask({this.child});

	@override
	Widget build(BuildContext context) {
		return ShaderMask(
			shaderCallback: (bounds) => RadialGradient(
				center: Alignment.center,
				radius: 0.7,
				colors: [Colors.lightBlue[100], Colors.blue[900]],
				tileMode: TileMode.mirror,
			).createShader(bounds),
			child: child,
		);
	}
}