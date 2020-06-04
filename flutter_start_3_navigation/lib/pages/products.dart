import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Details!'),
            ),
            Container(
              child: RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  color: Theme.of(context).accentColor,
                  //  Raised button that navigates back by routes
                  //  (requires Context) to know it's whereabouts
                  child: Text(title),
                  onPressed: () => Navigator.pop(context, true)),
            ),
            Text('Details!'),
          ],
        ));
  }
}
