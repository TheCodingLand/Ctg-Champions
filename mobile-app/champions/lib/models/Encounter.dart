


import 'index.dart';


const drawteam = Team(name: "Draw", flagImage: '');

class Encounter {
  final String id;
  final String name;
  final DateTime date;
  final String location;
  final Team teamHome;
  final Team teamAway;
  
  final int scoreHome;
  final int scoreAway;
  final bool ended;
  final Team draw= drawteam;
  final bool drawPossible;
  
  List<Event> events = [];

  
  bool isLive() {
    if (isStarted() && this.ended==false) {
    return true;
    }
    return false;
  }
  bool isStarted() {
    if (this.date.isBefore(DateTime.now())) {
    return true;
    }
    return false;
  }

  Encounter({this.id, this.name, this.date, this.location, this.teamHome, this.teamAway,
    this.scoreHome, this.scoreAway, this.ended, this.drawPossible});

  //set addEvent(Event event) {
  //  this.events.add(event);
  //}
}