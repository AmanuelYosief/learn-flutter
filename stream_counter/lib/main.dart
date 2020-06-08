import 'dart:async';

import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=H8c2rpOHZVc&list=WL&index=612
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  final StreamController _streamController = StreamController();
  // Using a StreamController, means you need to also manage memory and
  // any memory leak.

  // Adding data into the stream
  addData() async {
    for (int i = 0; i <= 10; i++) {
      // Setting up a second delay
      await Future.delayed(Duration(seconds: 1));
      // Then adds data to the source of the stream.
      // The Sink is the source.
      _streamController.sink.add(i);
    }
  }

  // The second way to create a stream
  // Provide a type e.g.
  Stream<int> numberStream() async* {
    for (int i = 0; i <= 10; i++) {
      // Setting up a second delay
      await Future.delayed(Duration(seconds: 1));
      // Then adds data to the source of the stream.
      // The Sink is the source.
      yield i;

      // No need to worry about memory leak, it closes on finish
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Managing memory and closing connection
    _streamController.close();
  }

  @override
  void initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Count up'),
        ),
        body: Center(
          child: StreamBuilder(
            stream: numberStream(), //previously _streamController.Stream,

            // More filtering
            // numberStream().where((number) => number%2 == 0), for even numbers
            // numberStream().map((number) => "number $number").

            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text("There is some error");
              } else if (snapshot == null) {
                return CircularProgressIndicator();
              }

              return Container(
                child: Text("${snapshot.data}",
                    style: Theme.of(context).textTheme.bodyText1),
              );
            },
          ),
        ));
  }
}
