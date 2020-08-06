import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Exchange',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFE79526),
        scaffoldBackgroundColor: Color(0xFF252525),
      ),
      home: Center(
        child: SplashScreen(
          seconds: 1,
          navigateAfterSeconds: HomeScreen(),
          image: Image.asset('images/bitcoin.png'),
          photoSize: 120,
          backgroundColor: Colors.black,
          loadingText: Text('Make sure network is Connected!'),
        ),
      ),
    );
  }
}
