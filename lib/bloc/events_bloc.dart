import 'package:bloc/bloc.dart';
import 'package:internet_folks_assignment/model/all_events.dart';
import 'package:internet_folks_assignment/model/event_details_model.dart';
import 'package:internet_folks_assignment/model/search_events.dart';
import 'package:meta/meta.dart';
import '../service/service.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final Service service = Service();
  EventsBloc() : super(EventsInitial()) {
    on<FetchEvents>((event, emit) async {
      Events events = await service.getAllEvents();
      emit(EventsLoadSuccess(events));
    });
    on<EventSearch>((event, emit) async {
      SearchEvent searchEvent = await service.getSearchedEvents(event.query);
      emit(SearchedEvent(searchEvent));
    });on<FetchDetails>((event, emit) async {
      EventDetails eventDetails = await service.getEventsDetails(event.id);
      emit(DetailedEvent(eventDetails));
    });
  }
}
