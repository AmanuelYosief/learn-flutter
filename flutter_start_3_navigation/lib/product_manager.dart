import 'package:flutter/material.dart';

import './products.dart';

import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct}) {
    print('[ProductManager Widget] Constructor');
  }

  // Need this for StateFulWidget
  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    if (widget.startingProduct != null) {
      print('[ProductManager State] initState()');
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  //  Whenever connected widget recieves updated data, this will refer
  //  to the old widget data and compare it to the new one
  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  //  ProductControl can't call setState to update data, hence it is passed up
  //  To this parent class, this function handles it
  void _addProduct(Map<String, String> product) {
    setState(() {
      //  Adds it to the product list
      _products.add(product);
    });
    print(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        // To pass data about the list of Products, to Products class,
        // ProductControl exists outside this class, we need a reference to it
        // without executing it's return function '(_addProduct())'
        child: ProductControl(_addProduct),
      ),
      Expanded(
          child: Products(_products,
              deleteProduct:
                  _deleteProduct) //  Now we execute Products, which returns a column

          )
    ]);
  }
}
