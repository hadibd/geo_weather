import 'package:flutter/material.dart';
import 'package:geo_weather/screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Geo Weather",
        debugShowCheckedModeBanner: false,
        home: LoadingScreen(),
        color: Colors.grey);
  }
}
