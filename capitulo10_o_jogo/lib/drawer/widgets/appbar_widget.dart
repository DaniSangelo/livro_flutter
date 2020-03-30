import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final Widget widgetToEndOpenDrawer;
  final Widget title;
  final bool centerTitle;
  final Function callbackFunction;

  const AppBarWidget({
    this.automaticallyImplyLeading = false,
    @required this.widgetToEndOpenDrawer,
    this.title,
    this.centerTitle = true,
    this.callbackFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
