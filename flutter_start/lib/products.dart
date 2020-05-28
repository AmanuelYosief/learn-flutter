import 'package:flutter/material.dart';


class Products extends StatelessWidget{




//  This is stateless as it just recieves a list of data, 
//  It can be considered Stateful, // however, it is argued since 
//  the change of data happens outside this class

//  To recieve the list of products, we build our constructor


//  Our property to store our list of products, Dart is typed and  Generic
List<String> products;
//  Imutable issue = everything in this class unchangeable, since it's stateless, 
//  hence add final. This tells Dart/Flutter, the value of product will never change, it will inititalized once
//  from the value we get from constructor but thereafter --> it is replaced, not changed. 

//  Accepts a list of products
Products(this.products);

@override
  Widget build(BuildContext context) {
    return Column(
            children: products
                .map((element) => Card(
                      child: Column(
                        children: <Widget>[
                        // Child is the context of the card
                        // Child is one widget, single widget, column is multiple widget positioned top to bottom
                        // Generic type <Widget> this will only hold widget
                        // Widget [] is an array, this array will only hold widget, allows us to add a list of data,
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