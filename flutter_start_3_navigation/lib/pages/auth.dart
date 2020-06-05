import 'package:flutter/material.dart';

import './products_admin.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () {
            // pushReplace, can be used for not navigation back, it has no back feature
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ProductAdminPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
