import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'Screens/convert_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFE79526),
        scaffoldBackgroundColor: Colors.white12, //Color(0xFF24292E),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        Conversion.id: (context) => Conversion(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
