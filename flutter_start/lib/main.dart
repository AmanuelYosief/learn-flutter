// Imports material package from flutter packages

import 'package:flutter/material.dart';

import './product_manager.dart';
// void main() {
//   runApp(MyApp()); // Run a widget, an object based on a class
// }

//  Fat arrow notion
void main() => runApp(MyApp());

// StatelessWidget can now be called from material package
class MyApp extends StatelessWidget {
  // To manage and change data inside, we add a Property
  // Dart is typed, product is a list of Generic String
  // Adding our first item 'Food Tester'

  @override
  Widget build(BuildContext context) {
    //  Build method returns what needs to be drawn on the screen
    //  Widget (Widget, BuildContext) is named, so that Typed lang Dart doesn't have to infer
    //  override is used to delibrately make it clear
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple
      ),
      home: Scaffold(
        //  Create a package
        appBar: AppBar(
          //  Create an app bar
          title: Text('EasyList555'),
        ),
        body: ProductManager(),
      ),
    );
    // Important rule; a widget always returns another widget in the build method,
    //  until you reach widgets that ships with flutter.
    // MaterialApp {} = Is a class imported from class material package
    // MaterialApp() = an object based on the class
    // new MaterialApp() = no longer needed in Flutter 2
  }
}

