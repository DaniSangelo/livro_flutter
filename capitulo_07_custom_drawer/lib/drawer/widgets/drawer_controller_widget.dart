import 'package:flutter/material.dart';

class DrawerControllerWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  final double topBody;
  final double leftBody;
  final Drawer drawer;
  final Function callbackFunction;

  DrawerControllerWidget(
      {this.appBar,
      this.body,
      this.topBody,
      this.leftBody,
      this.drawer,
      this.callbackFunction});

  GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();

  void openDrawer() {
    drawerKey.currentState.open();
  }

  void drawerCallback(bool status) {
    callbackFunction(status);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: (appBar == null)
                  ? AppBar()
                  : AppBar(
                      automaticallyImplyLeading:
                          appBar.automaticallyImplyLeading,
                      title: appBar.title,
                      centerTitle: appBar.centerTitle,
                      actions: <Widget>[
                        GestureDetector(
                          child: appBar.actions[0],
                          onTap: () => openDrawer(),
                        ),
                      ],
                    ),
            ),
//            ),
            (this.topBody != null || this.leftBody != null)
                ? AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    top: this.topBody != null ? this.topBody : null,
                    left: this.leftBody != null ? this.leftBody : null,
                    child: (body == null) ? Container() : body,
                  )
                : body,
            DrawerController(
//              edgeDragWidth: 100,
              key: drawerKey,
              alignment: DrawerAlignment.end,
              child: drawer != null ? drawer : Container(),
              drawerCallback: (status) => drawerCallback(status),
            ),
          ],
        ),
      );
}

//class DrawerControllerWidget extends StatelessWidget {
//  final GlobalKey<DrawerControllerState> _drawerKey =
//      GlobalKey<DrawerControllerState>();
//
////  final AppBarWidget appBar;
////  final Widget body;
////  final Drawer drawer;
////  final Function callbackFunction;
//
//  DrawerControllerWidget(
////      {
////        @required this.appBar,
////      @required this.body,
////      @required this.drawer,
////      this.callbackFunction
////      }
//      );
//
//  void openDrawer() {
//    _drawerKey.currentState?.open();
//  }
//
//  void drawerCallback(bool status) {
////    appBar.callbackFunction(status);
//  }
//
//  @override
//  Widget build(BuildContext context) => Scaffold(
//        body: Stack(
//          children: [
//            // body
//            Positioned(
//              top: 0.0,
//              left: 0.0,
//              right: 0.0,
//              child: AppBar(),
////              AppBar(
////                automaticallyImplyLeading: appBar.automaticallyImplyLeading,
////                actions: <Widget>[
////                  GestureDetector(
////                      child: Icon(Icons.menu),
////                      onTap: () {
////                        openDrawer();
////                      }),
////                ],
////                title: Text(
////                  "Jogo da Forca",
////                ),
////                centerTitle: true,
////              ),
//            ),
//
////            body,
//
////            DrawerController(
////              edgeDragWidth: 100,
////              key: _drawerKey,
////              alignment: DrawerAlignment.end,
////              child: drawer,
////              drawerCallback: (status) => drawerCallback(status),
////            ),
//          ],
//        ),
//      );
//}
