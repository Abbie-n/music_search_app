import 'package:flutter/material.dart';
import 'package:music_search_app/utils/app/theme.dart';
import 'package:music_search_app/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routes: {'/home': (context) => HomeScreen()},
      initialRoute: '/home',
    );
  }
}
