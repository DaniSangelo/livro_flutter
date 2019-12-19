import 'package:capitulo06_drawer/drawer/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class DrawerControllerWidget extends StatelessWidget {
  final GlobalKey<DrawerControllerState> _drawerKey =
      GlobalKey<DrawerControllerState>();

  final AppBarWidget appBar;
  final Widget body;
  final Drawer drawer;

  DrawerControllerWidget(
      {@required this.appBar, @required this.body, @required this.drawer});

  void openDrawer() {
    _drawerKey.currentState?.open();
  }

  void drawerCallback(bool status) {
    appBar.callbackFunction(status);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            // body
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                automaticallyImplyLeading: appBar.automaticallyImplyLeading,
                actions: <Widget>[
                  GestureDetector(
                      child: Icon(Icons.menu),
                      onTap: () {
                        openDrawer();
                      }),
                ],
                title: Text(
                  "Jogo da Forca",
                ),
                centerTitle: true,
              ),
            ),

            body,

            DrawerController(
              edgeDragWidth: 100,
              key: _drawerKey,
              alignment: DrawerAlignment.end,
              child: drawer,
              drawerCallback: (status) => drawerCallback(status),
            ),
          ],
        ),
      );
}
