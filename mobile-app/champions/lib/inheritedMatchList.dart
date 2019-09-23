import 'package:flutter/material.dart';
import 'package:champions/models/index.dart';

import 'package:champions/models/matches.dart';
DateTime date = DateTime.now();

Encounter addOne(String index) {
  Encounter m = Encounter(
    id: index,
    name: "Group 1 first match",
    date: date,
    location: "Paris",
    teamAway: MatchesDao.france,
    teamHome: MatchesDao.england,
    scoreAway: 0,
    scoreHome: 1,
    drawPossible: false
    //TODO: EVENTS to be a list property of Encounter and update here
  );
  return m;
}
/* class Encounter {
   String reference;

   Encounter(this.reference);
} */

class _MyInheritedMatchList extends InheritedWidget {
  _MyInheritedMatchList({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final MyInheritedMatchListWidgetState data;

  @override
  bool updateShouldNotify(_MyInheritedMatchList oldWidget) {
    return true;
  }
}

class MyInheritedMatchListWidget extends StatefulWidget {
  MyInheritedMatchListWidget({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  MyInheritedMatchListWidgetState createState() =>
      MyInheritedMatchListWidgetState();

  static MyInheritedMatchListWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_MyInheritedMatchList)
            as _MyInheritedMatchList)
        .data;
  }
}

class MyInheritedMatchListWidgetState
    extends State<MyInheritedMatchListWidget> {
  /// List of Encounters
  List<Encounter> matchEvents = MatchesDao.matches;

  /// Getter (number of Encounters)
  int get matchEventsCount => matchEvents.length;

  /// Helper method to add an Encounter

  void addEncounter() {
    //print(this.matchEventsCount);
    setState(() {
      matchEvents.add(addOne('${matchEventsCount + 1}'));
      //we need to pass the index of the event so the list has a reference to the correct match id for the details view
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInheritedMatchList(
      data: this,
      child: widget.child,
    );
  }
}
