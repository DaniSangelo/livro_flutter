import 'package:capitulo06_drawer/drawer/widgets/drawerbody_app.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawerbodycontent_app.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawerheader_app.dart';
import 'package:flutter/material.dart';

class DrawerRoute extends StatelessWidget {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jogo da Forca",
        ),
        centerTitle: true,
      ),
      body: Container(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeaderApp(),
            DrawerBodyApp(
              child: DrawerBodyContentApp(),
            ),
          ],
        ),
      ),
    );
  }
}

//                  Container(
//                    // This align moves the children to the bottom
//                    child: Align(
//                      alignment: FractionalOffset.bottomCenter,
//                      // This container holds all the children that will be aligned
//                      // on the bottom and should not scroll with the above ListView
//                      child: Container(
//                        child: Column(
//                          children: <Widget>[
//                            Divider(),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceAround,
//                              children: <Widget>[
//                                Image.asset(
//                                  'assets/images/drawer/utfpr.png',
//                                  width: 72.0,
//                                ),
//                                Image.asset(
//                                    'assets/images/drawer/casadocodigo.png',
//                                    width: 36.0),
//                                Image.asset('assets/images/drawer/flutter.png',
//                                    width: 36.0),
//                              ],
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
