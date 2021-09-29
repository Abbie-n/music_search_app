import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_search_app/core/blocs/search/search_bloc.dart';
import 'package:music_search_app/simple_bloc_observer.dart';
import 'package:music_search_app/utils/app/theme.dart';
import 'package:music_search_app/views/home_screen.dart';
import 'package:http/http.dart' as http;

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
      routes: {'/home': (context) => HomeScreen()},
      initialRoute: '/home',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => SearchBloc(
                    httpClient: http.Client(),
                  )..add(SearchDone()))
        ],
        child: HomeScreen(),
      ),
    );
  }
}
