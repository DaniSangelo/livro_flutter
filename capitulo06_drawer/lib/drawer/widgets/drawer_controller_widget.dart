import 'package:flutter/material.dart';

class DrawerControllerWidget extends StatelessWidget {
  final GlobalKey<DrawerControllerState> _drawerKey =
      GlobalKey<DrawerControllerState>();

  final Widget body;
  final Drawer drawer;

  DrawerControllerWidget({this.body, this.drawer});

  void openDrawer() {
    _drawerKey.currentState?.open();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
//        appBar: AppBar(
//          leading: GestureDetector(
//            child: Icon(Icons.menu),
//            onTap: openDrawer,
//          ),
//          title: Text(
//            "Jogo da Forca",
//          ),
//          centerTitle: true,
//        ),
        body: Stack(
          children: [
            // body
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: GestureDetector(
                  child: Icon(Icons.menu),
                  onTap: openDrawer,
                ),
                title: Text(
                  "Jogo da Forca",
                ),
                centerTitle: true,
              ),
            ),
            body,

            DrawerController(
              key: _drawerKey,
              alignment: DrawerAlignment.start,
              child: drawer,
              drawerCallback: (_) {
                print(_);
              },
//        dragStartBehavior: drawerDragStartBehavior,
              //widget.drawerDragStartBehavior,
//        scrimColor: drawerScrimColor,
//        edgeDragWidth: drawerEdgeDragWidth,
            ),
          ],
        ),
      );
}
