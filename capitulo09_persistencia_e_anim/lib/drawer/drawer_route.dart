import 'package:capitulo09_persistencia_e_anim/widgets/circular_image_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/drawer_controller_widget.dart';
import 'widgets/drawerbody_app.dart';
import 'widgets/drawerbodycontent_app.dart';
import 'widgets/drawerheader_app.dart';

class DrawerRoute extends StatelessWidget {
  BuildContext context;

  double _topBody() {
    return MediaQuery.of(this.context).size.height - 105;
  }

  double _leftBodyOpen() {
    return 5;
  }

  double _leftBodyClose() {
    return MediaQuery.of(this.context).size.width - 105;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return DrawerControllerWidget(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Jogo da Forca'),
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.menu,
            size: 40,
          ),
        ],
      ),
      topBody: _topBody(),
      leftBodyOpen: _leftBodyOpen(),
      leftBodyClose: _leftBodyClose(),
      body: CircularImageWidget(
        imageProvider: AssetImage('assets/images/splashscreen.png'),
        width: 100,
        heigth: 100,
      ),
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
