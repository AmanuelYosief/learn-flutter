import 'package:flutter/material.dart';

import './products.dart';

import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;
  //  Immutable class even though it is stateful, since the data changes in the state class,
  //  it is technically separated object, so this is final

  // Constructor set's the default value using optional arguement
  ProductManager({this.startingProduct = 'Sweets tester'});

  // Need this for StateFulWidget
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

//  Convection to use _CamelCase
class _ProductManagerState extends State<ProductManager> {
  //  Storing the list of products
  List<String> _products = [];

  // To set defaultValues or actions before the base class is called.
  @override
  void initState() {
    _products.add(widget
        .startingProduct); // setups the default/starting value for products
    super.initState(); // Base class is called after initState is run
  }

  //  Whenever connected widget recieves updated data, this will refer
  //  to the old widget data and compare it to the new one
  @override
  void didUpdateWidget(ProductManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //  ProductControl can't call setState to update data, hence it is passed up
  //  To this parent class, this function handles it
  void _addProduct(String product) {
    setState(() {
      //  Adds it to the product list
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          // To pass data about the list of Products, to Products class,
          // ProductControl exists outside this class, we need a reference to it
          // without executing it's return function '(_addProduct())'
          child: ProductControl(_addProduct),
        ),
        Products(_products) //  Now we execute Products, which returns a column
      ],
    );
  }
}
