import 'package:bloc/bloc.dart';
import 'events_events.dart';
import 'Event.dart';
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  @override
  // TODO: implement initialState
  EventsState get initialState => EventsState.initial();


  @override
  Stream<EventsState> mapEventToState(EventsEvent event) async* {
    
      if (event is AddEvent)
      {
        yield* _mapAddEventToState(event);
      }
  }


Stream<EventsState> _mapAddEventToState(AddEvent event) async* {
    //if (currentState is EventsLoaded) {
      final List<Event> updatedEvents =
          List.from((currentState).events)..add(event.event);
      //yield TodosLoaded(updatedTodos);
      //_saveTodos(updatedTodos);
    }
  }