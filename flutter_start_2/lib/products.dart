import 'package:flutter/material.dart';

class Products extends StatelessWidget {
//  Dart is typed and  Generic
  final List<String> products;
//  Imutable alert = everything in this class is unchangeable, since it's stateless
//  hence add final. This tells Dart/Flutter, the value of product will never change,
//  it will inititalized once in the constructor but thereafter --> it is replaced, not changed.

//  Accepts a list of products
  Products(this.products);
//  Named arguement doesn't work, for positional data,
//  optional arguement have to be wrapped with []
//  Products([this.products = const[]]) --> data can't be changed at all

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: products
          .map((element) => Card(
                child: Column(children: <Widget>[
                  // Child is the context of the card
                  // Child is one widget, single widget, column is multiple widget positioned top to bottom
                  // Generic type <Widget> this will only hold multiple widgets
                  // Widget [] is an array, allows us to add a list of data/widgets.
                  //  instead   of a single data piece, this is stored in the children item, separated by a comma
                  Image.asset('assets/food.jpg'),
                  Text(element)
                ]),
              ))
          .toList(), // Can't scroll, Columns is not the right widget
    );
  }
}
