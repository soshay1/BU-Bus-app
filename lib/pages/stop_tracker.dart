import 'package:flutter/material.dart';

class Stop_tracker extends StatelessWidget{
  static TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Stop_tracker({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Stop Tracker'),
      centerTitle: true,
    ),
    body: Center(
        child: Text('Stop Tracker',
          style: optionStyle
        )
    )
  );
}