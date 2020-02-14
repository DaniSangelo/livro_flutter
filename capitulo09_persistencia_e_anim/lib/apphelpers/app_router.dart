import 'package:capitulo09_persistencia_e_anim/appconstants/router_constants.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/palavras_crud_route.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/palavras_listview_route.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kPalavrasCRUDRoute:
        return MaterialPageRoute(builder: (_) => PalavrasCRUDRoute());
      case kPalavrasAllRoute:
        return MaterialPageRoute(builder: (_) => PalavrasListViewRoute());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
