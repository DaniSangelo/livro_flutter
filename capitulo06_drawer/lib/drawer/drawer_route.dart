import 'package:flutter/material.dart';

class DrawerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jogo da Forca",
        ),
        centerTitle: true,
        l
      ),
      body: Container(),
      drawer: Drawer(),
    );
  }
}
