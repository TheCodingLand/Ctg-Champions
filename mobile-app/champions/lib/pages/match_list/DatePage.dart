import 'dart:async';

import 'package:champions/calendar/date_utils.dart';
import 'package:flutter/material.dart';
import 'MatchList_test.dart';
import 'package:champions/calendar/calendarro.dart';
import 'package:event_bus/event_bus.dart';



var eventBus = EventBus();

class DayClickedEvent {
  DateTime date;
  int pageIndex;

  DayClickedEvent({this.date, this.pageIndex});
}

class ReservationsUpdatedEvent {}


class DaysPage extends StatefulWidget {
  final DateTime selectedDate;
  final Function onTap;
  const DaysPage({ this.selectedDate, this.onTap}): super();
  
  @override
  DaysViewState createState() {
    return DaysViewState();
  }
}

class DaysViewState extends State<DaysPage> {
  final calendarroStateKey = GlobalKey<CalendarroState>();
  
  Calendarro calendarro;
  PageView pageView;
  //StreamSubscription dayClickedEventSubscription;

 /*  @override
  void initState() {
    dayClickedEventSubscription =
        eventBus.on<DayClickedEvent>().listen((event) {
        ////print (event.date.toString());
      setState(() {
          
        var page = calendarro.getPositionOfDate(event.date);
        pageView.controller.jumpToPage(page);
      });
      ////print(event.date);
    });
  } */

  @override
  Widget build(BuildContext context) {
    DateTime startDate = DateUtils.getFirstDayOfCurrentMonth();
    DateTime endDate = DateUtils.getLastDayOfCurrentMonth();

    //f (startDate.weekday > 5) {
    //  startDate = DateUtils.addDaysToDate(startDate, 8 - startDate.weekday);
//      startDate = startDate.add(Duration(days: 8 - startDate.weekday));
    //}
    var today = DateTime.now();

    calendarro = Calendarro(
      key: calendarroStateKey,
      startDate: startDate,
      endDate: endDate,
      
      displayMode: DisplayMode.WEEKS,
      onTap: (date)=>handleTap(date),
      //dayTileBuilder: DaysViewTileBuilder(),
      
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
        pageSnapping: true,
        physics: BouncingScrollPhysics(),
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
    print ("Position : " + position.toString());
    //print (calendarro.startDate.toIso8601String());
    var nextDay = (calendarro.startDate.weekday - 1 + position);
    print ('NextDay :' + nextDay.toString());
    var nextDateWeekday = nextDay % 7;
    var nextDateWeek = (nextDay / 7).floor();

    var weekdayDifference = nextDateWeekday + 1 - calendarro.startDate.weekday;
    var selectedDate = DateUtils.addDaysToDate(calendarro.startDate, nextDateWeek * 7+ weekdayDifference);
    //var selectedDate = DateUtils.addDaysToDate(calendarro.startDate, nextDay);
    //print("Selected Date :" + selectedDate.toString());
    return selectedDate;
  }

  Widget buildDayView(int position) {
    DateTime currentSelectedDate = getDateFromPosition(position);
    //print('bulding matchlist' + currentSelectedDate.toIso8601String());

    return MatchList( currentSelectedDate, ()=>{});
  }

  /* @override
  void dispose() {
    dayClickedEventSubscription.cancel();
    super.dispose();
  }
 */
  void handleTap(date) {
    //print ("setting date" + date.toString());
     setState(() {
        ////print ("calendar" + calendarro.getPageForDate(date).toString())  ;

        var page = calendarro.getPositionOfDate(date);
        print(page);

        pageView.controller.jumpToPage(page);
        
      });
  }
  /* void handleTap() {
    widget.onTap(date => () )
    widget.selectedDate;
    setState(() {
          
        var page = calendarro.getPositionOfDate(date);
        pageView.controller.jumpToPage(page);
      }); */
    //calendarro.setSelectedDate(date);
    //calendarro.setCurrentDate(date);
    
    //eventBus.fire(DayClickedEvent());
}


// class DaysViewTileBuilder extends DayTileBuilder {
//   DateTime tileDate;
//   CalendarroState calendarro;

//   @override
//   Widget build(BuildContext context, DateTime tileDate, DateTimeCallback onTap) {
//     calendarro = Calendarro.of(context);
//     return new DateTileView(date: tileDate, calendarro: calendarro);
//   }
// }