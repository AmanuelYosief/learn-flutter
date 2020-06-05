import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  _showWarningDialog(BuildContext context) {
    showDialog(
        // Requires the context
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action can be undone!'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Discard'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Back Button Pressed");
        // Now have to manually program for the software
        //  and hardware back button since we are blocking default
        Navigator.pop(context, false);
        return Future.value(
            false); // If this is set to True, it deletes the other page aswell, hence false.
        // Instead of null, now can decide and make use of back button returns.
      },
      child: Scaffold(
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
                      child: Text("DELETE"),
                      onPressed:
                          () => _showWarningDialog(context)) // Promise can be added to listen for return,
                  ),
              Text('Details!'),
            ],
          )),
    );
  }
}
