import 'package:flutter/material.dart';
import 'package:mytestapp/pages/schedule.dart';

class Selection extends StatelessWidget{
  final items = ["DCL IN", "DCL OUT", "WS IN", "WS OUT", "UDC", "ITC", "RRT", "OAK"];
  static TextStyle optionStyle =
  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  Selection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => Container(
          height: MediaQuery.of(context).size.height / (items.length+1), // screen size / itemCount
          margin: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScheduleBuilder()),
                      );
                    },
                    title: Text(
                      items[index],
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                ),
              ),
          ),
        ),
      ),
      /*ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(child:ListTile(
              title: Text("DCL IN", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("DCL OUT", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("WS IN", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("WS OUT", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("UDC", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("RRT", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("OAK", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
          Card(child:ListTile(
              title: Text("ITC", textAlign: TextAlign.center,),
              trailing: Icon(Icons.star))),
        ],
      )
  );*/
  );
}