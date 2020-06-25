import 'package:evil_insults/services/insult_api.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = false;
  var newInsult;

  Future<void> getInsult() async {
    InsultServices insultServices = InsultServices();
    await insultServices.getInsult();
    setState(() {
      _loading = false;
    });
    newInsult = insultServices.insultDatabase;
  }

  @override
  void initState() {
    // TODO: implement initState
    _loading = true;
    super.initState();
    getInsult();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Evil Insults Generator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
          onRefresh: getInsult,
          child: _loading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Stack(
                    
                    children: <Widget>[
                      
                      ListView(),
                      Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            color: Colors.white,
                            child: Text(
                              newInsult[0].insult,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Container(
                            child: Builder(builder: (context) {
                            return RaisedButton(
                              elevation: 0.0,
                              color: Colors.white,
                              child: Icon(Icons.share),
                              onPressed: () {
                                final RenderBox box =
                                    context.findRenderObject();

                                Share.share(
                                    (newInsult[0].insult +
                                        '- via Evil Insults'),
                                    subject: 'Share',
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                              },
                            );
                          }))
                        ],
                      ),
                    ],
                  ),
                )),
    );
  }
}
