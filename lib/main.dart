import 'package:flutter/material.dart';
import 'package:mytestapp/pages/next_bus.dart';
import 'package:mytestapp/pages/schedule.dart';
import 'package:mytestapp/pages/selection.dart';
import 'package:mytestapp/pages/settings.dart';
import 'package:mytestapp/pages/stop_tracker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final _widgetOptions=[
    Selection(),
    Next_bus(),
    Stop_tracker(),
    Settings()
  ];
  /*static const List<Widget> _widgetOptions = <Widget>[
    Schedule(),
    Center(
        child: Text(
          'Next Bus',
          style: optionStyle,
        )),
    Center(
        child: Text(
          'Stop Tracker',
          style: optionStyle,
        )),
    Center(
        child: Text(
          'Settings',
          style: optionStyle,
        )),
  ];*/

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),*/
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted), //or icon.feed?
            label: 'Schedule',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled), // looks almost unidentifiable yet the rest of the icons are filled in
            label: 'Next Bus',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Stop Tracker',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFFE7CB),
        onTap: _onItemTapped,
      ),
    );
  }
}
