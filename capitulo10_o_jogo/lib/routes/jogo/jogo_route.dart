import 'package:flutter/material.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.red[900],
              child: Text('Vamos jogar a FORCA?'),
            ),
            Container(
              height: 50,
              color: Colors.blue,
              child: RaisedButton(),
            ),
            Container(height: 100, color: Colors.green),
            Container(height: 350, color: Colors.yellow),
            Container(height: 100, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
