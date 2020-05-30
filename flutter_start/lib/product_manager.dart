import 'package:flutter/material.dart';

import './products.dart';

import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  //  Immutable class even though it is stateful, since the data changes in the state class,
  //  it is technically separated object, so this is final
  ProductManager({this.startingProduct = 'Sweets tester'}); //named arguement

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    _products.add(widget
        .startingProduct); // setups the default/starting value for products
    super.initState(); // Base class is called after initState is run
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    // Whenever connected widget recieves updated data
    //  This refers to the old widget data and compares to the new one
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(
              _addProduct), // Adding (), will make it execute and get a return
              // we only want to pass to the ProductControl
        ),
        Products(_products)
        // If optional is used, since it's a constant and default is null
        // Products();
      ],
    );
  }
}
