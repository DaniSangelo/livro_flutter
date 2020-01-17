import 'package:capitulo08_rotas_e_transicoes/app_constants/router_constants.dart';
import 'package:capitulo08_rotas_e_transicoes/routes/palavras/palavras_crud_route.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kPalavrasCRUDRoute:
        return MaterialPageRoute(builder: (_) => PalavrasCRUDRoute());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
