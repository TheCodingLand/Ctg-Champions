
import 'package:champions/calendar/date_utils.dart';
import 'package:flutter/material.dart';
import 'MatchList.dart';
import 'package:champions/calendar/calendarro.dart';
import 'package:event_bus/event_bus.dart';



var eventBus = EventBus();

class DayClickedEvent {
  DateTime date;
  int pageIndex;

  DayClickedEvent({this.date, this.pageIndex});
}




class DaysPage extends StatefulWidget {
  final DateTime selectedDate;
  final Function onTap;
  final List<DateTime> matchDays;
  const DaysPage({ this.matchDays, this.selectedDate, this.onTap}): super();
  
  @override
  DaysViewState createState() {
    return DaysViewState();
  }
}

class DaysViewState extends State<DaysPage> {
  final calendarroStateKey = GlobalKey<CalendarroState>();
  
  Calendarro calendarro;
  PageView pageView;
  @override
  Widget build(BuildContext context) {
    //DateTime startDate = DateUtils.getFirstDayOfCurrentMonth();
    
    
    var today = DateTime.now();
    DateTime startDate = DateUtils.addDaysToDate(today,-10);
    DateTime endDate = DateUtils.addDaysToDate(today,60);
    calendarro = Calendarro(
      key: calendarroStateKey,
      startDate: startDate,
      endDate: endDate,
      
      displayMode: DisplayMode.WEEKS,
      onTap: (date)=>handleTap(date),
      //dayTileBuilder: DaysViewTileBuilder(),
      matchDays: widget.matchDays,
      selectedDate: today,
    );

    var lastPosition = calendarro.getPositionOfDate(endDate);
    //print("lastPosition" + lastPosition.toString());
    var todayPosition = calendarro.getPositionOfDate(today);
    //print("todayPosition" + todayPosition.toString());
    pageView = new PageView.builder(
        
        itemBuilder: (context, position) => buildDayView(position),
        itemCount: lastPosition + 1,
        controller: new PageController(initialPage: todayPosition),
        //pageSnapping: true,
//        physics: BouncingScrollPhysics(),
        onPageChanged: (position) {
          //print(todayPosition);
          DateTime selectedDate = getDateFromPosition(position);
          //print ("selectedDate : " + selectedDate.toIso8601String());
          calendarroStateKey.currentState.setSelectedDate(selectedDate);
          calendarroStateKey.currentState.setCurrentDate(selectedDate);
        });
    double height = MediaQuery.of(context).size.height;
    return Column(mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      
     Container(child: calendarro),
     

     Container( height: height -146,child: pageView)
    ]);
  }

  DateTime getDateFromPosition(int position) {
    //print ("Position : " + position.toString());
    //print (calendarro.startDate.toIso8601String());
    var nextDay = (calendarro.startDate.weekday - 1 + position);
    //print ('NextDay :' + nextDay.toString());
    var nextDateWeekday = nextDay % 7;
    var nextDateWeek = (nextDay / 7).floor();

    var weekdayDifference = nextDateWeekday + 1 - calendarro.startDate.weekday;
    var selectedDate = DateUtils.addDaysToDate(calendarro.startDate, nextDateWeek * 7+ weekdayDifference);
    return selectedDate;
  }

  Widget buildDayView(int position) {
    DateTime currentSelectedDate = getDateFromPosition(position);
    //print('bulding matchlist' + currentSelectedDate.toIso8601String());

    return MatchList( currentSelectedDate, ()=>{});
  }

  void handleTap(date) {
    //print ("setting date" + date.toString());
     setState(() {
        ////print ("calendar" + calendarro.getPageForDate(date).toString())  ;

        var page = calendarro.getPositionOfDate(date);
        //print(page);

        pageView.controller.jumpToPage(page);
        
      });
  }
  
}
