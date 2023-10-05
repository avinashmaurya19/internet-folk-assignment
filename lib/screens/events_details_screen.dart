import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../bloc/events_bloc.dart';

class EventDetails extends StatefulWidget {
  final String id;
  const EventDetails({super.key, required this.id});

  @override
  State<EventDetails> createState() => _EventDetailsState();
  

}

class _EventDetailsState extends State<EventDetails> {
  @override
  void initState() {
    // TODO: implement initState
     BlocProvider.of<EventsBloc>(context).add(FetchDetails(widget.id));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ElevatedButton(
            child: const Text("BOOK NOW"),
            onPressed: () {},
          )),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.message),
        ],
        title: const Text(
          'Events Details',
        ),
      ),
      body: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          if (state is DetailedEvent) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * .3,
                    width: width,
                    color: Colors.red,
                  ),
                  Text(
                    state.eventDetails.content?.data?.title ?? "",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          size: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          size: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.home,
                          size: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "The internet folks",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Text(
                    "about events",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   "The internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folks",
                  //   style: TextStyle(color: Colors.black, fontSize: 30),
                  // ),
                  const ReadMoreText(
                    "The internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folksThe internet folks",
                    trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: 'Read Less',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    // moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}
