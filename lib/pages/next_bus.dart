import 'package:flutter/material.dart';

class Next_bus extends StatelessWidget{
  static TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Next_bus({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Next Bus'),
      centerTitle: true,
    ),
    body: Center(
        child: Text('Next Bus',
          style: optionStyle
        )
    )
  );
}