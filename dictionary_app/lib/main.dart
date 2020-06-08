import 'dart:async'; // Async functions
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

//  There is two kinds of streams.
// Single-subscription streams or Broadcast stream
//  Single type = allows only a single listerner during the whole lifetime of stream
//  Broadcast stream allows any numbers of listerns and fires it's events when they are
//  ready, whether there are listerners or not.

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _url = "https://owlbot.info/api/v4/dictionary/";
  String _token = "7e0bbb5dbe89ec2163a8394a3a9951969fa2fe7d";

  TextEditingController _controller = TextEditingController();

  StreamController _streamController;
  // StreamController allows for sending data, error and done events on it's stream
  // It is used to create a simple stream that others can listen on and to push events to that stream

  Stream _stream;
  // The stream that the controller is controlling.
  // The stream will be set to _StreamController.stream on initialization

  Timer _debounce;

  _search() async {
    if (_controller.text == null || _controller.text.length == 0) {
      _streamController.add(null);
      // Since this is a <T> futures, it will return a null (or any values i assign)
      return;
    }

    // returns a <T> futures text, this can be used to control loading
    _streamController.add("waiting");

    // Uses the URL and token, and headers to get the data and return it as
    // a decoded json file
    try {
      Response response = await get(_url + _controller.text.trim(),
          headers: {"Authorization": "Token " + _token});
      _streamController.add(json.decode(response.body));
      print("IT IS HERE");
      print(response);
    } catch (e) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Icon(
            Icons.error,
            color: Colors.red,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          Text("Try Again"),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Setting up the StreamController. This is one only supports on single subscriber
    _streamController = StreamController();
    _stream = _streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flictionary"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: TextFormField(
                    onChanged: (String text) {
                      if (_debounce?.isActive ?? false) _debounce.cancel();
                      _debounce = Timer(const Duration(milliseconds: 1000), () {
                        _search();
                      });
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search for a word",
                      contentPadding: const EdgeInsets.only(left: 24.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  _search();
                },
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          // Creates a new StreamBuilder that builds itself based on the lastest
          // snapshot of interaction with the specified stream and whose build
          // strategy is given by builder[]
          // The initialData is used to create the initial snapshot.

          stream: _stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            //<int> e.g.
            if (snapshot.data == null || !snapshot.hasData) {
              // If the stream returns a null value
              return Center(
                child: Text("Enter a search word"),
              );
            } else if (snapshot.hasError) {
              // Further error catching with snapshot.connectionState);
              return Center(child: Text("Failed to fetch data"));
            } else if (snapshot.data == "waiting") {
              // Steam is not null and waiting for a asynctionous response
              return Center(
                child: CircularProgressIndicator(),
              );
            }

/*
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Not connected to the Stream or null');
              case ConnectionState.waiting:
                return Text('awaiting interaction');
              case ConnectionState.active:
                return Text('Stream has started but not finished');
              case ConnectionState.done:
                return Text('Stream has finished');
            }

*/
            return ListView.builder(
              // Uses a listview to show the data, which is scrollable.
              // it is important to specify it's length first
              itemCount: snapshot.data["definitions"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListBody(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[300],
                      child: ListTile(
                        leading: snapshot.data["definitions"][index]
                                    ["image_url"] ==
                                null
                            ? null
                            : CircleAvatar(
                                // NetworkImage is an object that fetches the image at the
                                // given URL.
                                backgroundImage: NetworkImage(snapshot
                                    .data["definitions"][index]["image_url"]),
                              ),
                        title: Text(_controller.text.trim() +
                            "(" +
                            snapshot.data["definitions"][index]["type"] +
                            ")"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          snapshot.data["definitions"][index]["definition"]),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
