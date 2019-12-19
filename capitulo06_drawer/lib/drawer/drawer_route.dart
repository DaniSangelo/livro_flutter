import 'package:capitulo06_drawer/drawer/widgets/appbar_widget.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawer_controller_widget.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawerbody_app.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawerbodycontent_app.dart';
import 'package:capitulo06_drawer/drawer/widgets/drawerheader_app.dart';
import 'package:capitulo06_drawer/scopedmodel/drawer_scoped_model.dart';
import 'package:capitulo06_drawer/widgets/circular_image_widget.dart';
import 'package:flutter/material.dart';
import '../functions/device_functions.dart' as DeviceFunctions;
import 'package:scoped_model/scoped_model.dart';

class DrawerRoute extends StatefulWidget {
  @override
  _DrawerRouteState createState() => _DrawerRouteState();
}

class _DrawerRouteState extends State<DrawerRoute> {
  bool isExpanded = false;
  double _width, _heigth, _left, _top; //, _safeAreaTop, _safeAreaBottom;
//  var _scaffoldKey = new GlobalKey<ScaffoldState>();

//  bool drawerOpen = false;
//  DrawerCallback drawerCallback(bool status) {
//    print("OK");
//    setState(() {
//      drawerOpen = status;
//    });
//  }

  //#region initState
  @override
  void initState() {
    super.initState();
    _width = DeviceFunctions.Dimensoes.deviceWidth;
    _heigth = DeviceFunctions.Dimensoes.deviceHeight -
        DeviceFunctions.Dimensoes.safeAreaBottom;
    _left = _width - 105;
    _top = _heigth - 105;
  }
  //#endregion

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DrawerControllerWidget(
        appBar: AppBarWidget(
          widgetToEndOpenDrawer: Icon(Icons.menu),
          title: Text(
            "Jogo da Forca",
          ),
          callbackFunction: _handleDrawer,
        ),
        body: ScopedModelDescendant<DrawerScopedModel>(
            builder: (context, child, model) {
          return AnimatedPositioned(
            top: _top,
            left: model.isDrawerOpen ? 3 : _width - 105,
            duration: Duration(seconds: 1),
            child: CircularImageWidget(
              imageProvider: AssetImage('assets/images/splashscreen.png'),
              width: 100,
              heigth: 100,
//                border: 2,
            ),
          );
        }),
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
      ),
    );
//    return Scaffold(
//      key: _scaffoldKey,
//      appBar: AppBar(
//        leading: GestureDetector(
//          child: Icon(Icons.menu),
//          onTap: _handleDrawer,
//        ),
//        title: Text(
//          "Jogo da Forca",
//        ),
//        centerTitle: true,
//      ),
//      body: Stack(
//        children: <Widget>[
//          Material(
//              child: DrawerControllerWidget(
//            body: AnimatedPositioned(
//              top: _top,
//              left: _left,
//              duration: Duration(seconds: 1),
//              child: CircularImageWidget(
//                imageProvider: AssetImage('assets/images/splashscreen.png'),
//                width: 100,
//                heigth: 100,
////                border: 2,
//              ),
//            ),
//            drawer: Drawer(
//              child: Column(
//                children: <Widget>[
//                  DrawerHeaderApp(),
//                  DrawerBodyApp(
//                    child: DrawerBodyContentApp(),
//                  ),
//                ],
//              ),
//            ),
//          )),
//        ],
//      ),
//      //https://stackoverflow.com/questions/51891799/how-to-use-drawer-without-scaffold-drawer
////      drawer: Drawer(
////        child: Column(
////          children: <Widget>[
////            DrawerHeaderApp(),
////            DrawerBodyApp(
////              child: DrawerBodyContentApp(),
////            ),
////          ],
////        ),
////      ),
//    );
  }

  _handleDrawer(bool isDrawerOpen) {
    DrawerScopedModel.of(context)
        .registerTranstion(statusOfDrawer: isDrawerOpen);
//    _left = isDrawerOpen ? 3 : _width - 105;
//    _scaffoldKey.currentState.openDrawer();
//    print('AQUI');
//    setState(() {
//      _rigth = (!_scaffoldKey.currentState.isDrawerOpen) ? _width - 105 : 0;
//      _left = 3;
//      _top = _heigth - _safeAreaTop - 165;
//    });
  }
}

//class DrawerRoute extends StatelessWidget {
//  bool isExpanded = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Jogo da Forca",
//        ),
//        centerTitle: true,
//      ),
//      body: Container(),
//      drawer: Drawer(
//        child: Column(
//          children: <Widget>[
//            DrawerHeaderApp(),
//            DrawerBodyApp(
//              child: DrawerBodyContentApp(),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

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
