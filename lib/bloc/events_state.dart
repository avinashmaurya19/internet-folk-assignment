part of 'events_bloc.dart';

@immutable
sealed class EventsState {}

final class EventsInitial extends EventsState {}

class EventsLoadSuccess extends EventsState {
  final Events events;

  EventsLoadSuccess(this.events);
}

class SearchedEvent extends EventsState {
  final SearchEvent searchEvent;

  SearchedEvent(this.searchEvent);
}

class DetailedEvent extends EventsState {
  final EventDetails eventDetails;

  DetailedEvent(this.eventDetails);
}
