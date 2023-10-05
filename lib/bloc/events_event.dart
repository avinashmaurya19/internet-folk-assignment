part of 'events_bloc.dart';

@immutable
sealed class EventsEvent {}

class FetchEvents extends EventsEvent {}

class EventSearch extends EventsEvent {
  final String query;

  EventSearch(this.query);
}

class FetchDetails extends EventsEvent {
  final String id;

  FetchDetails(this.id);
}
