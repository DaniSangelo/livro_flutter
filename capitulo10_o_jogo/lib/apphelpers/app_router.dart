import 'package:capitulo10ojogo/appconstants/router_constants.dart';
import 'package:capitulo10ojogo/routes/jogo/jogo_route.dart';
import 'package:capitulo10ojogo/routes/jogo/vitoria_route.dart';
import 'package:capitulo10ojogo/routes/palavras/palavras_crud_route.dart';
import 'package:capitulo10ojogo/routes/palavras/palavras_listview_route.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kPalavrasCRUDRoute:
        return MaterialPageRoute(
          builder: (_) => PalavrasCRUDRoute(
            palavraModel:
                settings.arguments != null ? settings.arguments : null,
          ),
        );
      case kPalavrasAllRoute:
        return MaterialPageRoute(builder: (_) => PalavrasListViewRoute());
      case kJogoRoute:
        return MaterialPageRoute(builder: (_) => JogoRoute());
      case kVitoriaRoute:
        return MaterialPageRoute(builder: (_) => VitoriaRoute());
      case kDerrotaRoute:
        return MaterialPageRoute(builder: (_) => JogoRoute());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
