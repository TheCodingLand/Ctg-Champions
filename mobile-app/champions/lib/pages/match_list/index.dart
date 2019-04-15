import 'package:flutter/material.dart';
//import 'package:champions/ui/home/GradientAppBar.dart';
import 'package:champions/pages/match_list/MatchList.dart';
import 'package:champions/common/CustomAppBar.dart';
import 'package:champions/calendar/calendarro.dart';
import 'package:champions/calendar/date_utils.dart';
//import 'package:date_utils/date_utils.dart' as DateUtils;
//import 'package:date_utils/date_utils';
import 'DatePage.dart';
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
    print(d.toString());
    setState(() {
      date = d;
      
    });
    
  }
  DateTime getCurrentDate() { return this.date; }
  @override
  Widget build(BuildContext context) {

    return 
    Column(
      children: <Widget>[
        
        CustomAppBar("Calendar"),
        Calendarro(
                startDate: DateUtils.getFirstDayOfCurrentMonth(),
                endDate: DateUtils.getLastDayOfCurrentMonth(),
                displayMode: DisplayMode.WEEKS,
                selectedDate: date,
                
                onTap: (date) => setDate(date),
        ),
        MatchList(date,setDate),
        
        //DaysPage()
       
    
        

        
      ],
    );
  }
}