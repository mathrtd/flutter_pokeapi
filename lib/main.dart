import 'package:flutter/material.dart';
import 'package:flutter_pokemons/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "CircularStd",
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "CircularStd",
              displayColor: Colors.black,
            ),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
      home: HomeScreen(title: 'PokeAPI App'),
    );
  }
}
