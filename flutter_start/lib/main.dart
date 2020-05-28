// Imports material package from flutter packages

import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp()); // Run a widget, an object based on a class
// }

//  Fat arrow notion
void main() => runApp(MyApp());

// StatelessWidget can now be called from material package
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // Returns stateful object,  this stateful object will belong to a stateful widget. 
    //  We create a connection between two classes
    return _MyAppState();
  }
}

// Build is required, so once Main is run, it call a build method
// Context is meta information about your app, position of widget, theme e.g. 
// underscore is a convection for stateful widgets, that can only be used this file
class _MyAppState extends State<MyApp> {

  // To manage and change data inside, we add a Property
  // Dart is typed, product is a list of Generic String
  // Adding our first item 'Food Tester'
  List<String> _products = ['Food Tester'];
  @override
  Widget build(BuildContext context) {
    //  Build method returns what needs to be drawn on the screen
    //  Widget (Widget, BuildContext) is named, so that Typed lang Dart doesn't have to infer
    //  override is used to delibrately make it clear
    return MaterialApp(
      home: Scaffold(
        //  Create a package
        appBar: AppBar(
          //  Create an app bar
          title: Text('EasyList'),
        ),
        body: Column(
          children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                setState(() {
                _products.add('Advanced Food Tester');
                });
              }
                // Once build is called, when launch is first loaded or data is changed
                // We want to use the data to recreate dynamically with every button press
                //  This isn't possible in a StatelessWidget which only accepts external data
                // It doesnt work with internal data, called once and doesn't call,
                // Hence Stateless is changed to Stateful Widget
              ,
              child: Text('Add Product'),
            ),
          ),
          Column(
            children: _products
                .map((element) => Card(
                      child: Column(
                        children: <Widget>[
                        // Child is the context of the card
                        // Child is one widget, single widget, column is multiple widget positioned top to bottom
                        // Generic type <Widget> this will only hold widget
                        // Widget []S is an array, this array will only hold widget, allows us to add a list of data,
                        //  instead   of a single data piece, this is stored in the children item, separated by a comma
                        Image.asset('assets/food.jpg'),
                        Text(element)
                      ]
                      ),
                    ))
                .toList(),
          ),
        ]),
      ),
    );
    // Important rule; a widget always returns another widget in the build method,
    //until you reach widgets that ships with flutter.
    // MaterialApp {} = Is a class imported from class material package
    // MaterialApp() = an object based on the class
    // new MaterialApp() = no longer needed in Flutter 2
  }
}

