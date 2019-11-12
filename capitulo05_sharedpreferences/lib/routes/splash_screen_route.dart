import 'dart:async';

import 'package:capitulo05_sharedpreferences/routes/home_route.dart';
import 'package:capitulo05_sharedpreferences/routes/welcome_route.dart';
import 'package:capitulo05_sharedpreferences/shared_preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import '../widgets/circular_image_widget.dart';

class SplashScreenRoute extends StatefulWidget {
  @override
  _SplashScreenRouteState createState() => _SplashScreenRouteState();
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
//      WidgetsBinding.instance.addPostFrameCallback((_) async {
      AppPreferences.getWelcomeRead().then((status) {
        _whereToNavigate(welcomeRead: status);
      });
//      print(welcomeRead);
    });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularImageWidget(
          imageProvider: AssetImage(
            'assets/images/splashscreen.png',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25),
          child: Text(
            'Aguarde....',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: LinearProgressIndicator(
            backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]),
          ),
        ),
      ],
    );
  }

  _whereToNavigate({@required bool welcomeRead}) {
    if (welcomeRead)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeRoute()));
    else
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeRoute()),
      );
  }
}
