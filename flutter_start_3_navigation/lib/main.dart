import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/products_admin.dart';
import './pages/products.dart';
import './pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];

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
    //  Build method returns what needs to be drawn on the screen
    //  Widget (Widget, BuildContext) is named, so that Typed lang Dart doesn't have to infer
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      //home: AuthPage(),

      // Global Page Registery using Routes
      routes: {
        // Home route
        // Since we have already registered the values for constructor, we don't require setting up anywhere else
        // They get replaced by pushReplaceNamed(context, '/');
        '/': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductAdminPage(),
      },
      // Passing data through noutes
      //'/product' : (BuildContext context) => ProductPage(
      //            products[index]['title'], products[index]['image']),
      // Used for routes not in our global registry and passing data
      // This generates and returns a route

      // handles named routes not registed in route registry, We can now add our own logical
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElements =
            setting.name.split('/'); //'/product/1'

        // If the route doesn't have a slash
        if (pathElements[0] != '') {
          return null;
        }
        // First slash
        if (pathElements[1] == 'product') {
          // Second Slash
          // We can dynamically create a page and pass data about a product, this way
          final int index = int.parse(pathElements[2]);
          // Converts '2' into an idenx
          // This will make it clear, that it returns a bool
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'], _products[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        // If a named route is not registered in Global Registry or Generate Route
        // this returns a default fail route
        // This goes back to the starting page
        return MaterialPageRoute(builder: (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct));

      },




    );
  }
}
