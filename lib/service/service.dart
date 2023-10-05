import 'dart:convert';

import 'package:internet_folks_assignment/model/all_events.dart';
import 'package:http/http.dart' as http;
import 'package:internet_folks_assignment/model/event_details_model.dart';
import 'package:internet_folks_assignment/model/search_events.dart';

class Service {
  Future<Events> getAllEvents() async {
    final header = {
      "Content-Type": "application/json; charset=utf-8",
      "Date": "Fri, 24 Mar 2023 10:58:42 GMT",
      "Transfer-Encoding": "chunked",
    };
    http.Response response = await http.get(
        Uri.parse(
            "https://sde-007.api.assignment.theinternetfolks.works/v1/event"),
        headers: header);
    final decodedData = jsonDecode(response.body);
    Events events = Events.fromJson(decodedData);
    return events;
  }

  Future<SearchEvent> getSearchedEvents(String query) async {
    final header = {
      "Content-Type": "application/json; charset=utf-8",
      "Date": "Fri, 24 Mar 2023 10:58:52 GMT",
      "Content-Length": "987",
    };
    http.Response response = await http.get(
        Uri.parse(
            "https://sde-007.api.assignment.theinternetfolks.works/v1/event?search=$query"),
        headers: header);
    final decodedData = jsonDecode(response.body);
    SearchEvent searchEvent = SearchEvent.fromJson(decodedData);
    return searchEvent;
  }

  Future<EventDetails> getEventsDetails(String id) async {
    final header = {
      "Content-Type": "application/json; charset=utf-8",
      "Date": "Fri, 24 Mar 2023 10:58:29 GMT",
      "Content-Length": "764",
    };
    http.Response response = await http.get(
        Uri.parse(
            "https://sde-007.api.assignment.theinternetfolks.works/v1/event/$id"),
        headers: header);
    final decodedData = jsonDecode(response.body);
    EventDetails eventDetails = EventDetails.fromJson(decodedData);
    return eventDetails;
  }
}
