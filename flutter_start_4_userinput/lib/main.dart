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
  // Global data, so that it doesn't get destroy and accessible
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
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      //  home: AuthPage(),
      // Global Page Registery using Routes
      routes: {
        // Home route
        '/': (BuildContext context) =>
            ProductsPage(_products, _addProduct, _deleteProduct),
        // This setups the values for the constructur, this means it's not needed to be setup elsewhere 
        // Elsewhere gets replaced by pushReplaceNamed(context, '/');
        '/admin': (BuildContext context) => ProductAdminPage(),
      },
      // Passing data through noutes
      //'/product' : (BuildContext context) => ProductPage(
      //            products[index]['title'], products[index]['image']),


      // handles named routes not registed in route registry and passing data,
      //  Additionally, it provides us with ability to add logic
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
        return null; //Returns a route
      },
      onUnknownRoute: (RouteSettings settings) {
        // If a named route is not registered in Global Registry or Generate Route
        // this returns a default fail route 404
        // This goes back to the starting page
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                ProductsPage(_products, _addProduct, _deleteProduct));
      },
    );
  }
}
