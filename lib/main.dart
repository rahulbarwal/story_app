import 'package:flutter/material.dart';
import 'package:story_app/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mirrors to the past',
        theme: ThemeData(
            primaryColor: Color(0xFF5061e6),
            backgroundColor: Color(0xFF2d3347),
            accentColor: Color(0xFFff6e6f)),
        home: HomeScreen());
  }
}
