import 'package:capitulo10ojogo/routes/jogo/mixins/jogo_mixin.dart';
import 'package:flutter/material.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> with JogoMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titulo(),
            botaoParaSorteioDePalavra(),
            Container(height: 100, color: Colors.green),
            Container(height: 350, color: Colors.yellow),
            Container(height: 100, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
