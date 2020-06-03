import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: Column(
          children: <Widget>[
            Text('Details!'),
            RaisedButton( //  Raised button that navigates back by routes 
            //  (requires Context) to know it's whereabouts
                child: Text('BACK'), onPressed: () => Navigator.pop(context))
          ],
        ));
  }
}
