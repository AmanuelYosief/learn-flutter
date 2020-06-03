import 'package:flutter/material.dart';

import './pages/products.dart';

class Products extends StatelessWidget {
//  Dart is typed and  Generic
  final List<Map<String, String>> products;

  Products([this.products = const []]);

  Widget _buildProductItem(BuildContext context, int index) {

    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]['image']),
        Text(products[index]['title']),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                child: Text('Details'),
                // Material provides Navigation routes, which push taking
                // context as the first arguement. This keeps information about the page and where the page is located in the context
                //  The context is passed to the builder, the builder takes in the context, to take the information of what is need to be build
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductPage(
                          products[index]['title'], products[index]['image']),
                    ))),
          ],
        )
      ]),
    );
  }

  Widget _buildProductLists() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Center(
        child: Text("No Product found, please add some"),
      );
    }

    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductLists();
  }
}
