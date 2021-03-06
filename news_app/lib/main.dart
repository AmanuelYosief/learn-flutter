import 'package:flutter/material.dart';
import 'package:news_app/ui_pages/homepage.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DailyNews',
      theme: ThemeData(primaryColor: Colors.white),
      home: HomePage(),
    );
  }
}
