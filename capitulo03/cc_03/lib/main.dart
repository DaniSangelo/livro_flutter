import 'package:flutter/material.dart';

import 'constants/application_constants.dart';
import 'drawer/drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppDrawer(title: kAppTitle),
    );
  }
}
