import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  static TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
      centerTitle: true,
    ),
    body: Center(
        child: Text('Settings',
          style: optionStyle
        )
    )
  );
}