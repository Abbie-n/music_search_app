import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_search_app/simple_bloc_observer.dart';
import 'package:music_search_app/utils/app/theme.dart';
import 'package:music_search_app/views/home_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: HomeScreen(),
    );
  }
}
