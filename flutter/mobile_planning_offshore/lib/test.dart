import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Test widget
class Test extends StatefulWidget {
  	Test({Key key}) 
    : super(key: key);

	@override
	_TestState createState() => _TestState();
}

// Test state
class _TestState extends State<Test> {

  	@override
  	Widget build(BuildContext context) {

		return Scaffold(

			// ---> Page
			body: Container(
				decoration: new BoxDecoration(color: Color(0xFFFFFFFF)),
				child: Stack(
					children: <Widget>[

            			// ---> Wind Park Card
						Stack(
							children: <Widget>[

								// ---> Back Cards
								Center(
									child: Column(
										children: <Widget>[

											SizedBox(height: 110),

											Stack(
												overflow: Overflow.visible,
												children: <Widget>[
													Container(
														width: MediaQuery.of(context).size.width - 50,
														height: 130,
														decoration: BoxDecoration(
															color: Color(0x66FFFFFF),
															borderRadius: BorderRadius.all(Radius.circular(8.0))
														)
													)
												]
											)

										]
									)
								),

								// ---> Front Cards
								Center(
									child: Column(
										children: <Widget>[

											SizedBox(height: 100),

											Stack(
												overflow: Overflow.visible,
												children: <Widget>[
													Material(
														elevation: 4,
														borderRadius: BorderRadius.all(Radius.circular(8.0)),
														child: Container(
															width: MediaQuery.of(context).size.width - 80,
															height: 150,
															decoration: BoxDecoration(
																color: Colors.white,
																borderRadius: BorderRadius.all(Radius.circular(8.0))
															)
														)
													)
												]
											),

											// ---> Card Counter
											Container(
												width: 50,
												height: 40,
												child: Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: <Widget>[
														Icon(Icons.lens, color: Color(0xCCFFFFFF), size: 12),
														Icon(Icons.lens, color: Color(0xFFFFFFFF), size: 12),
														Icon(Icons.lens, color: Color(0xCCFFFFFF), size: 12)
													],
												)
											)

											// 10 px left FOR OVERLAY !!!
										]
									)
								),
							]
						),

						// ---> Top Bar
						TopBar(),

						// ---> Bottom Bar
						BottomBar(),

						// ---> Page
						Column(
							children: <Widget>[

								// ---> Top Margin
								SizedBox(height: 70),

								// ---> Test Box
								Center(
									child: Container(
										width: MediaQuery.of(context).size.width - 40,
										height: 270,
										decoration: new BoxDecoration(
											color: Color(0xFFFFFFFF),
											boxShadow: [
												BoxShadow(
													color: Color(0x33444444),
													blurRadius: 2.0,
													spreadRadius: 2.0, 
													offset: Offset(1.0, 1.0),
												)
											],
											borderRadius: new BorderRadius.all(Radius.circular(20))
										),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.center,
											children: <Widget>[

											]
										)
									)
								),

								// ---> Margin
								SizedBox(height: 30),

								// ---> Test Button
								Container(
									width: 200,
									height: 45,
									child: RaisedButton(
										color: Color(0xFFFFFFFF),
										padding: const EdgeInsets.all(0.0),
										child: Ink(
											decoration: BoxDecoration(
												gradient: LinearGradient(
													colors: [Color(0xFF1565C0), Color(0xFF81D4FA)],
													begin: Alignment.centerLeft,
													end: Alignment.centerRight
												),
												borderRadius: BorderRadius.circular(30),
											),
											child: Center(
												child: Container(						
													child: Text(
														"LOG IN",
														style: TextStyle(
															color: Color(0xFFFFFFFF)
														)
													)
												)
											)
										),
										elevation: 0,
										shape: RoundedRectangleBorder(
											borderRadius: new BorderRadius.circular(30)
										),
										onPressed: () {
											debugPrint("Test in");
										}
									)
								),

								// ---> Margin
								SizedBox(height: 20),

								// ---> Caption
								Center(
									child: Column(	
										children: <Widget>[
											Text(
												"Don't have an account?",
												style: TextStyle(color: Color(0xAAAAAAAA))
											),
											SizedBox(height: 5),
											GestureDetector(
												onTap:() { 
													debugPrint("Sign up");
												},
												child: Text(										
													"Sign up",
													style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold)
												)
											)
										]
									)
								),

							]
						)
					]
				)
			) 
		);
  	}
}

// Top Bar
class TopBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: _PaintTopBar(),
      ),
    );
  }
}

// Bottom bar
class BottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: CustomPaint(
        painter: _PaintBottomBar(),
      ),
    );
  }
}

// Painters
class _PaintTopBar extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final double waveHeight = 130;
	final double highHeight = 160;

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, highHeight);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, waveHeight);

	Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
	  ..lineTo(bottomLeft.dx, bottomLeft.dy)
	  ..lineTo(bottomRight.dx, bottomRight.dy)
	  ..lineTo(topRight.dx, topRight.dy);

	Rect rect = Rect.fromPoints(topLeft, bottomRight);

	final Gradient gradient = new LinearGradient(
      	colors: <Color>[Color(0xFF81D4FA), Color(0xFF1565C0)]
    );
	
	Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..shader = gradient.createShader(rect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _PaintBottomBar extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final double waveHeight = size.height - 100;

    Offset topLeft = Offset(0, waveHeight - 15);
    Offset bottomLeft = Offset(0, size.height);
    Offset bottomRight = Offset(size.width, size.height);

	Offset firstControlPoint = Offset(size.width * 1 / 11, waveHeight - 20);
    Offset firstEndPoint = Offset(size.width * 2 / 11, waveHeight);

	Offset secondControlPoint = Offset(size.width * 5 / 11, waveHeight + 50);
    Offset secondEndPoint = Offset(size.width * 8 / 11, waveHeight);

	Offset thirdControlPoint = Offset(size.width * 12 / 11, waveHeight - 80);
    Offset thirdEndPoint = Offset(size.width * 13 / 11, waveHeight);

	Path path = Path()
      ..moveTo(bottomRight.dx, bottomRight.dy)
	  ..lineTo(bottomLeft.dx, bottomLeft.dy)
	  ..lineTo(topLeft.dx, topLeft.dy)
	  ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy)
	  ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy)
	  ..quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

	Rect rect = Rect.fromPoints(topLeft, bottomRight);

	final Gradient gradient = new LinearGradient(
      	colors: <Color>[Color(0xFF1565C0), Color(0xFF81D4FA)] 
    );
	
	Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..shader = gradient.createShader(rect);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}