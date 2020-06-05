import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/auth.dart';
import './pages/products_admin.dart';
import './pages/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (BuildContext context) => ProductsPage(),
        '/admin': (BuildContext context) => ProductAdminPage(),
      },
      // Passing data through noutes
      //'/product' : (BuildContext context) => ProductPage(
      //            products[index]['title'], products[index]['image']),
      // Used for routes not in our global registry and passing data
      // This generates and returns a route
      onGenerateRoute: (RouteSettings setting) {
        final List<String> pathElements =
            setting.name.split('/'); //'/product/1'

        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          // Converts '2' into an idenx
          return CupertinoPageRoute(
            builder: (BuildContext context) =>
                ProductPage(products[index]['title'], products[index]['image']),
          );
        }
        return null;
      },
    );
  }
}
