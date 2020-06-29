import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uk_goverment_app/ui_pages/home_page.dart';
import 'package:uk_goverment_app/ui_pages/test_api.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestApi(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              //child: Image.asset(),),)
              ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'https://a.thumbs.redditmedia.com/vXTYRh366lja9jtCEcVJdfxaofd7rQG0BDf6l-A7sr4.png',
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "UK",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      'Petitions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  'Create a new petition, or search and sign other peoples petitions to the UK Parliament and government',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Get Started',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
