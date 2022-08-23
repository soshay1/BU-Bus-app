import 'package:flutter/material.dart';
final myKey = new GlobalKey<_ScheduleState>();

class ScheduleBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Schedule(key: myKey,);
  }
}
class Schedule extends StatefulWidget{
  const Schedule({ Key? key }) : super(key: key);
  @override
  State<Schedule> createState() => _ScheduleState();
}
class _ScheduleState extends State<Schedule> with SingleTickerProviderStateMixin {
  String get title => _title;
  int get activeTabIndex => _activeTabIndex;
  static const _title='DCL IN';
  //Schedule({Key? key}) : super(key: key);
  late TabController controller;
  int _activeTabIndex=0;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
    controller.addListener(_setActiveTabIndex);
    final now = DateTime.now();
  }
  void _setActiveTabIndex() {
    _activeTabIndex = controller.index;
  }
  /*
  input: current time (upon init)
  output: index the tab should be on
  * */
  int dateShow(){
    return 0;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(_title),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                text: 'Mon-Thurs',
              ),
              Tab(
                text: 'Friday',
              ),
              Tab(
                text: 'Saturday',
              ),
              Tab(
                text: 'Sunday',
              ),
            ],
            isScrollable: true,
          ),
        ),
        body: ScheduleData(),
      ),
    );
  }
}
class ScheduleData extends StatefulWidget {
  const ScheduleData({Key? key}) : super(key: key);

  @override
  State<ScheduleData> createState() => _ScheduleDataState();
}

class _ScheduleDataState extends State<ScheduleData> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          child: DataTable(
            rows: [], // DONT PROVIDE ROWS
            columns: const <DataColumn>[
              DataColumn(
                label: Text('First stop'),
              ),
              DataColumn(
                label: Text('Stop 2'),
              ),
              DataColumn(
                label: Text('Stop 3'),
              ),
              DataColumn(
                label: Text('Last stop'),
              ),
            ], // PROVIDE YOUR COLUMNS HERE
          ),
        ),
        Expanded(
          //fit: FlexFit.tight,
          child: SingleChildScrollView(
            //width: double.infinity,
            scrollDirection: Axis.vertical,
            //child:FittedBox(
              //width: double.infinity,
              child: DataTable(
                columns: List.generate(
                    4, (index) => DataColumn(label: Text(''))), // GENERATE EMPTY COLUMNS
                headingRowHeight: 0,
                rows: List<DataRow>.generate(
                  numItems,
                      (int index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          // All rows will have the same selected color.
                          if (states.contains(MaterialState.selected)) {
                            return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                          }
                          // Even rows will have a grey color.
                          if (index.isEven) {
                            return Colors.grey.withOpacity(0.3);
                          }
                          if(index==7){
                            return Colors.green.withOpacity(0.3);
                          }
                          return null; // Use default value for other states and odd rows.
                        }),
                    cells: <DataCell>[
                      DataCell(Text('2:3${index}',
                        style: index==7 ? TextStyle(fontWeight: FontWeight.w600) : TextStyle(fontWeight: FontWeight.w400),)),
                      DataCell(Text('2:3${index+1}')),
                      DataCell(Text('2:3${index+2}')),
                      DataCell(
                          //Text('2:3${index+3}')
                          Text(myKey.currentState!.activeTabIndex.toString())
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
       // ),
      ],
    );
  }
}
