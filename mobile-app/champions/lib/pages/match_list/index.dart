import 'package:flutter/material.dart';
import 'package:champions/common/CustomAppBar.dart';
import 'DatePage.dart';
import 'package:champions/inheritedMatchList.dart';

class HomePage extends StatelessWidget {
  void _add() => {};
  void _remove() => {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
    
  DateTime today= DateTime.now();
  DateTime date; 
  @override
  void initState() {
    super.initState();
    date = DateTime.now();
  }

  void setDate(d) {
    //print(d.toString());
    setState(() {
      date = d;
      
    });
    
  }
  DateTime getCurrentDate() { return this.date; }
  @override
  Widget build(BuildContext context) {
    final MyInheritedMatchListWidgetState matches = MyInheritedMatchListWidget.of(context);
    List <DateTime> matchDays= <DateTime>[];
    for (var m in matches.matchEvents) {matchDays.add(m.date);}
    //print (matchDays);
    return 
    Column(
      children: <Widget>[
        
        CustomAppBar("Calendar"),
        
        DaysPage(matchDays: matchDays ,selectedDate: date,
                
                onTap: (date) => setDate(date),)
       
    
        

        
      ],
    );
  }
}