import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_folks_assignment/bloc/events_bloc.dart';
import 'package:internet_folks_assignment/screens/search_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/login': (context) => const LoginScreen(),
        '/home': (context) => BlocProvider(
              create: (context) => EventsBloc(),
              child: HomeScreen(),
            ),
            
      },
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => EventsBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
