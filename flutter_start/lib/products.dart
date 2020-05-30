import 'package:flutter/material.dart';

// StatelessWidget called from material package
class Products extends StatelessWidget{

//  As this is stateless, it just recieves a list of data, 
//  This class is stateless since it can be argued that
//  the change of data happens outside this class, hence Stateless


//  To recieve the list of products, we build our constructor
//  Our property to store our list of products
//  Dart is typed and  Generic
final List<String> products;
//  Imutable alert = everything in this class is unchangeable, since it's stateless, 
//  hence add final. This tells Dart/Flutter, the value of product will never change, 
//  it will inititalized once in the constructor but thereafter --> it is replaced, not changed. 

//  Accepts a list of products
Products(this.products);
// Named arguement doesn't work, for positional, optional arguement are wrapped with to be []
// this needs to be constant, so const. so this is a list that can't be changed
// Products([this.products = const[]])


@override
  Widget build(BuildContext context) {
    return Column(
            children: products
                .map((element) => Card(
                      child: Column(
                        children: <Widget>[
                        // Child is the context of the card
                        // Child is one widget, single widget, column is multiple widget positioned top to bottom
                        // Generic type <Widget> this will only hold multiple widgets
                        // Widget [] is an array, allows us to add a list of data/widgets.
                        //  instead   of a single data piece, this is stored in the children item, separated by a comma
                        Image.asset('assets/food.jpg'),
                        Text(element)
                      ]
                      ),
                    ))
                .toList(),
          );
  }
}