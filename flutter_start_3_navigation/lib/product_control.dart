import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  // To store a function reference call from parent class
  final Function addProduct;

  ProductControl(this.addProduct);
  // Parent class function is passdown using constructor, and stored

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        // Since it is external and stateless (chosen)
        // This means that setState can't be called here to dynamically update.
        // Hence, we will use ProductManager and pass it the data up to Parent
        addProduct({
          'title': 'Chocolate',
          'image': 'assets/food.jpg'
        }); // Key Value pairs for Map
        //
      },
      child: Text('Add Product'),
    );
  }
}
