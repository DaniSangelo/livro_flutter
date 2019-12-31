import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'functions/device_functions.dart' as DeviceFunctions;
import 'routes/splash_screen_route.dart';
import 'scopedmodel/drawer_scoped_model.dart';

void main() => runApp(ForcaApp());

class ForcaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrawerScopedModel>(
      model: DrawerScopedModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Forca da UTFPR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.green,
        ),
        home: ForcaHomePage(),
      ),
    );
  }
}

class ForcaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceFunctions.Dimensoes.deviceHeight = MediaQuery.of(context).size.height;
    DeviceFunctions.Dimensoes.deviceWidth = MediaQuery.of(context).size.width;
    DeviceFunctions.Dimensoes.shortestSide =
        MediaQuery.of(context).size.shortestSide;
    DeviceFunctions.Dimensoes.safeAreaTop = MediaQuery.of(context).padding.top;
    DeviceFunctions.Dimensoes.safeAreaBottom =
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: SplashScreenRoute(),
    );
  }
}
