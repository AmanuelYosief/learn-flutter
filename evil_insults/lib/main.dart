import 'package:evil_insults/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evil Insults',
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
