import 'package:flutter/material.dart';

import './products.dart';

import './product_control.dart';

class ProductManager extends StatelessWidget {
  // Need this for StateFulWidget
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        // To pass data about the list of Products, to Products class,
        // ProductControl exists outside this class, we need a reference to it
        // without executing it's return function '(_addProduct())'
        child: ProductControl(addProduct),
      ),
      Expanded(
          child: Products(products,
              deleteProduct:
                  deleteProduct) //  Now we execute Products, which returns a column

          )
    ]);
  }
}
