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

  Widget _buildProductItem(BuildContext context, int index) {
    // This function returns the widget and takes two information
    // Build context e.g. theme information and so on
    // The index of the item
    return Card(
      child: Column(children: <Widget>[
        // Child is the context of the card
        // Child is one widget, single widget, column is multiple widget positioned top to bottom
        // Generic type <Widget> this will only hold multiple widgets
        // Widget [] is an array, allows us to add a list of data/widgets.
        //  instead   of a single data piece, this is stored in the children item, separated by a comma
        Image.asset('assets/food.jpg'),
        Text(products[index])
      ]),
    );
  }

  Widget _buildProductLists() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
        // This removes items when we don't see them
        //  and add them when we need to see them
      );
    } else {
      // productsCards = Container(); to render an empty container
      productCards = Center(
        child: Text("No Product found, please add some"),
      );
    }
    ;

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductLists();
  }
}
