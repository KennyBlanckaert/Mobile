import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(Main());

// Main
class Main extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Offshore P lanning',
            home: Login()
        );
    }
}
