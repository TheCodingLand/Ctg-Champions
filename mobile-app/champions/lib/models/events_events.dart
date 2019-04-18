import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'Event.dart';


@immutable
abstract class EventsEvent extends Equatable {
  EventsEvent([List props = const []]) : super(props);
}

class AddEvent extends EventsEvent {

  final Event event;

  AddEvent(this.event) : super([event]);

  @override
  String toString() => 'AddTodo { todo: ${event.text} }';
}

