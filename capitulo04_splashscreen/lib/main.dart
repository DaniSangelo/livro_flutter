import 'package:capitulo04_splashscreen/routes/splash_screen_route.dart';
import 'package:flutter/material.dart';

void main() => runApp(ForcaApp());

class ForcaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forca da UTFPR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.green,
      ),
      home: ForcaHomePage(),
    );
  }
}

class ForcaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenRoute(),
    );
  }
}
