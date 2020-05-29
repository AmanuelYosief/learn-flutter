import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {

  final String startingProduct;
  //  Immutable class even though it is stateful, since the data changes in the state class, 
  //  it is technically separated object, so this is final
  ProductManager(this.startingProduct);
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager>{
    List<String> _products = [];

    @override
  void initState() {
    _products.add(widget.startingProduct); // setups the default/starting value for products
    super.initState(); // Base class is called after initState is run 
  }


  @override
  void didUpdateWidget(ProductManager oldWidget) {
    // Whenever connected widget recieves updated data
    //  This refers to the old widget data and compares to the new one
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
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