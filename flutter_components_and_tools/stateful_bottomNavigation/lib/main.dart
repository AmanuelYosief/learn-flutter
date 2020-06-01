import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyBottomNavigationState();
  }
}

class _MyBottomNavigationState extends State<MyApp> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bottom Navigation'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Account')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('Settings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.announcement), title: Text('Announcement')),
          ],
          onTap: (index) {
            setState(() {
              this._selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
