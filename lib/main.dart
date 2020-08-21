import 'package:BMI_Calculator/constants.dart';
import 'package:BMI_Calculator/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(86, 106, 223, 1),
        scaffoldBackgroundColor: Color.fromRGBO(247, 249, 254, 1),
      ),
      home: SafeArea(child: Center(child: SplashScreenEffect())),
    );
  }
}

class SplashScreenEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        title: Text('BMI   Calculator'.toUpperCase(), style: kSplashTitle),
        seconds: 2,
        navigateAfterSeconds: Home(),
        image: Image.asset('images/screen.jpg'),
        backgroundColor: Colors.white,
        photoSize: 180.0,
        loaderColor: Colors.white,
      ),
    );
  }
}
