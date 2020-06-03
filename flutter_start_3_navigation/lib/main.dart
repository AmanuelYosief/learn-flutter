import 'package:flutter/material.dart';

import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Build method returns what needs to be drawn on the screen
    //  Widget (Widget, BuildContext) is named, so that Typed lang Dart doesn't have to infer

    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: HomePage(),
    );
  }
}
