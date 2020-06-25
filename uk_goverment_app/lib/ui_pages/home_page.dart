import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:uk_goverment_app/ui_pages/splash_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
            SafeArea(
              minimum: const EdgeInsets.all(15),
              child: Container(
                //color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    smallWhiteSpace(),
                    Row(
                      children: <Widget>[
                        //topBar(),
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            //color: Color.fromRGBO(0, 107, 61, 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/images/uk_petition_icon.png",
                                  width: 60,
                                ),
                                smallWhiteSpace(),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Colors.blue,
                                          child: Text(
                                            'UK Goverment and Parliament',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.blue,
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.search,
                                              ),
                                              onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home(),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    smallWhiteSpace(),
                    Text('Popular Petitions',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

SizedBox topBar() {
  return SizedBox(
    height: 120,
    child:
        //padding: const EdgeInsets.only(top: 40),
        Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.white,
          child: Stack(
            children: [
              Image.network(
                'https://a.thumbs.redditmedia.com/vXTYRh366lja9jtCEcVJdfxaofd7rQG0BDf6l-A7sr4.png',
                width: 70,
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget smallWhiteSpace() => SizedBox(
      height: 10,
    );

Widget mediumWhiteSpace() => SizedBox(
      height: 30,
    );

Widget largeWhiteSpace() => SizedBox(
      height: 60,
    );
