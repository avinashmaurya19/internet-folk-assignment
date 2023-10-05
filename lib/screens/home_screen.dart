import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_folks_assignment/bloc/events_bloc.dart';
import 'package:internet_folks_assignment/screens/events_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<EventsBloc>(context).add(FetchEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: const [
          Icon(
            Icons.search,
            size: 35,
            color: Color(0xff120d26),
          ),
          Icon(
            Icons.more_vert_outlined,
            size: 30,
            color: Color(0xff120d26),
          )
        ],
        title: const Text(
          'Events',
          style: TextStyle(fontSize: 40, color: Color(0xff120d26)),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child:
              BlocBuilder<EventsBloc, EventsState>(builder: (context, state) {
            if (state is EventsLoadSuccess) {
              return ListView.builder(
                itemCount: state.events.content?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => EventsBloc(),
                                    child: EventDetails(
                                      id: state.events.content?.data?[index].id
                                              .toString() ??
                                          "",
                                    ),
                                  )));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * .156,
                          width: width * .19,
                          color: Colors.green,
                          child: Image.network(
                            state.events.content?.data?[index].bannerImage ??
                                "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: width * .09,
                        ),
                        SizedBox(
                          height: 292,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.events.content?.data?[index].dateTime ??
                                      "",
                                  style: TextStyle(color: Color(0xff5669ff)),
                                ),
                                // Text(
                                //   'Apr 28',
                                //   style: TextStyle(color: Color(0xff5669ff)),
                                // ),
                                // Text(
                                //   '.',
                                //   style: TextStyle(color: Color(0xff5669ff)),
                                // ),
                                // Text(
                                //   '5:30 PM',
                                //   style: TextStyle(color: Color(0xff5669ff)),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: height * .009,
                            ),
                            SizedBox(
                              width: width * .45,
                              child: Text(state.events.content?.data?[index]
                                      .description ??
                                  ""),
                            ),
                            SizedBox(
                              height: height * .009,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.location_disabled_sharp),
                                Text('Radius Gallary . santa cruz , CA')
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return Container(
              child: Text("Loading"),
            );
          })),
    );
  }
}
