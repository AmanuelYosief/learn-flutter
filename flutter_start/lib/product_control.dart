import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  // We are only rendering a button statitically, which doesn't change
  final Function addProduct;

  ProductControl(this.addProduct);
  // Now we have an access to a function, even though we didn't define it.

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        // This means that setState can't be called here. 
        // Hence, we will use ProductControl widget, instead of ProductManager
        addProduct('Sweets');
        // 
      },
      child: Text('Add Product'),
    );
    // Once build is called, when launch is first loaded or data is changed
    // We want to use the data to recreate dynamically with every button press
    //  This isn't possible in a StatelessWidget which only accepts external data
    // It doesnt work with internal data, called once and doesn't call,
    // Hence Stateless is changed to Stateful Widget
  }
}
