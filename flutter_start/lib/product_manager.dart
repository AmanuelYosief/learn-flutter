import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager>{

    List<String> _products = ['Food Tester'];

    
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column( children: [Container(
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
          Products(_products)
          ],
          );
  }
  
}