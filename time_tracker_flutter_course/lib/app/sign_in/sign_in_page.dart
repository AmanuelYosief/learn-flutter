import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  
  SignInPage({@required this.onSignIn});

  final Function(FirebaseUser) onSignIn;

  Future<void> _signInAnonymously() async {
    // signlenton amd  go to definition
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(authResult.user);
      //return print('${authResult.user.uid}');
    } catch (e) {
      print(e.toString());
    }

    ///  * `ERROR_OPERATION_NOT_ALLOWED` - Indicates that Anonymous accounts are not enabled.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: _buildContainer(),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildContainer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {},
          ),
          SizedBox(height: 8.0),
          Text(
            'or',
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed:
                _signInAnonymously, // {} => _signInAnonymously, since this is a call back that takes no arguement, and so is signInAnonymously,we can just pass the name
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
