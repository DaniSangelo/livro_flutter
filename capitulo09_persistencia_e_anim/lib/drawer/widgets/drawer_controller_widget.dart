import 'package:capitulo09_persistencia_e_anim/drawer/blocs/drawer_bloc_enums.dart';
import 'package:capitulo09_persistencia_e_anim/drawer/blocs/drawer_open_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerControllerWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  final double topBody;
  final double leftBodyOpen;
  final double leftBodyClose;
  final Drawer drawer;
  final Function callbackFunction;

  DrawerControllerWidget(
      {this.appBar,
      this.body,
      this.topBody,
      this.leftBodyOpen,
      this.leftBodyClose,
      this.drawer,
      this.callbackFunction});

  GlobalKey<DrawerControllerState> drawerKey =
      GlobalKey<DrawerControllerState>();

  BuildContext context;

  void openDrawer() {
    drawerKey.currentState.open();
  }

  void drawerCallback(bool status) {
    BlocProvider.of<DrawerOpenStateBloc>(this.context)
        .add(status ? DrawerControllerEvent.open : DrawerControllerEvent.close);
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: (appBar == null)
                ? AppBar()
                : AppBar(
                    automaticallyImplyLeading: appBar.automaticallyImplyLeading,
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
          (this.topBody != null ||
                  this.leftBodyOpen != null ||
                  this.leftBodyClose != null)
              ? BlocBuilder<DrawerOpenStateBloc, bool>(
                  builder: (context, isDrawerOpen) {
                  double left =
                      isDrawerOpen ? this.leftBodyOpen : this.leftBodyClose;
                  return AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    top: this.topBody != null ? this.topBody : null,
                    left: left != null ? left : null,
                    child: (body == null) ? Container() : body,
                  );
                })
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
}
