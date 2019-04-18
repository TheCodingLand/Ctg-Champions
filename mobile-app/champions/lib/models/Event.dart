import 'index.dart';
class Event {
  final int gameminute;
  
  final Team team;
  final String text;
  Event({this.gameminute,this.team, this.text });
}

class EventsState { 
  List<Event> events;

  EventsState._();
  factory EventsState.initial() {
    return EventsState._()..events = [];

  }

}