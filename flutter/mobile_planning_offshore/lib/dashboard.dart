import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// Dashboard widget
class Dashboard extends StatefulWidget {
  	Dashboard({Key key}) 
    : super(key: key);

	@override
	_DashboardState createState() => _DashboardState();
}

// Dashboard state
class _DashboardState extends State<Dashboard> {

	// Properties
	int _current = 0;

	// Static Database
	int _items = 5;
	List<String> customers = List.from(["Merkur", "C-Power", "Rentel", "Seamade", "Norther"], growable: true);
	List<String> locations = List.from(["German wind farm by Fabricom & Smulders", "Belgian wind farm on the Thornton Bank", "Belgian wind farm by Otary", "Belgian Seastar/Mermaid Fusion wind park", "Belgian wind farm by Otary"], growable: true);
	List<int> tasks = List.from([22, 34, 12, 61, 7], growable: true);
	List<String> times = List.from(["01:43:13", "02:13:34", "13:23:16", "21:38:24", "07:03:12"], growable: true);
	List<int> turbines = List.from([150, 54, 42, 58, 44], growable: true);


	// Renderer
	@override
	Widget build(BuildContext context) {

		return Scaffold(
			body: Container(
				color: Colors.blueGrey[50],
				width: MediaQuery.of(context).size.width,
				height: MediaQuery.of(context).size.height,
				child: Stack(
					children: <Widget>[

						// ---> Background
						Container(
							width: MediaQuery.of(context).size.width,
							height: MediaQuery.of(context).size.height,
							decoration: BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.topCenter,
									end: Alignment.bottomCenter,
									colors: <Color>[Colors.lightBlue[200], Colors.blue[800]]
								)
							)
						),

						// ---> Hamburger Menu

						// ---> Add Floating Button

           				// ---> Top Page
						Stack(
							children: <Widget>[
								Center(
									child: Column(
										children: <Widget>[

											// ---> Margin
											SizedBox(height: 100),

											// ---> Caroussel
											CarouselSlider(
												height: 180,
												viewportFraction: 0.98,
												items: this.getCards(),
												onPageChanged: (index) => { 
													setState(() => _current = index)
												}
											),

											// ---> Dotted Indicator
											Container(
												width: 20.0 * this._items,
												height: 40,
												child: Row(
													mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: this.getIndicator(),
												)
											)
										]
									)
								)
							]
						)

						// ---> Actions

					]
				)
			)
		);
	}

	// Functions
	List<Widget> getIndicator() {
		List<Widget> dots = new List<Widget>();
		for (var i = 0; i < this._items; i++) {
			dots.add(
				new Icon(
					Icons.lens, 
					color: (this._current == i ? Color(0xFFFFFFFF) : Color(0xAAFFFFFF)), 
					size: 12
				)
			);
		}
		return dots;
	}

	List<Widget> getCards() {
		return List<int>.generate(this._items, (int index) => index).map((i) {
			final double widthOfCard = MediaQuery.of(context).size.width * 0.90;	// Not width of caroussel, but width of caroussel's container!! (ratio required)

			return Builder(
				builder: (BuildContext context) {

					// Container to add side-margins to the card
					return Container(
						width: MediaQuery.of(context).size.width,
						margin: EdgeInsets.symmetric(horizontal: 10.0),
						decoration: BoxDecoration(
							color: Colors.white,
							borderRadius: BorderRadius.all(Radius.circular(5.0))
						),

						// Column to add multiple rows
						child: Column(
							children: <Widget>[

								// Row for the titles
								Container(
									width: MediaQuery.of(context).size.width,
									height: 90,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[

											// Maintitle
											Row(
												mainAxisAlignment: MainAxisAlignment.center,
												children: <Widget>[
													Container(
														width: widthOfCard,
														child: Center(child: Text(this.customers[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
													)
												]
											),

											// Margin
											SizedBox(height: 5),

											// Subtitle
											Row(
												mainAxisAlignment: MainAxisAlignment.center,
												children: <Widget>[
													Container(
														width: widthOfCard,
														child: Center(child: Text(this.locations[i], style: TextStyle(fontSize: 10, color: Colors.grey)))
													)
												]
											)
										]
									)
								),

								// Row for the child-titles
								Container(
									width: MediaQuery.of(context).size.width,
									height: 30,
									child: Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: <Widget>[
											Container(
												width: widthOfCard / 3, 
												child: Center(child: Text("TASKS", style: TextStyle(fontSize: 10, color: Colors.grey)))
											),
											Container(
												width: widthOfCard / 3,
												child: Center(child: Text("TIME SPENT", style: TextStyle(fontSize: 10, color: Colors.grey)))
											),
											Container(
												width: widthOfCard / 3,
												child: Center(child: Text("TURBINES", style: TextStyle(fontSize: 10, color: Colors.grey)))
											)
										]
									)
								),

								// Row for the child-values
								Container(
									width: MediaQuery.of(context).size.width,
									height: 30,
									child:Row(
										mainAxisAlignment: MainAxisAlignment.spaceEvenly,
										children: <Widget>[
											Container(
												width: widthOfCard / 3,
												child: Center(child: Text(this.tasks[i].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
											),
											Container(
												width: widthOfCard / 3,
												child: Center(child: Text(this.times[i], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
											),
											Container(
												width: widthOfCard / 3,
												child: Center(child: Text(this.turbines[i].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))
											)
										]
									)
								)
							]
						)
					);
				}
			);
		}).toList();
	}
}