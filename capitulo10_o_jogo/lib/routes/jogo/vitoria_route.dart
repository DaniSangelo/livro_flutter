import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/jogo_store.dart';
import 'package:flutter/material.dart';

class VitoriaRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((_) {
      getIt.get<JogoStore>().ganhou = false;
    });
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/jogo/vitoria.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}
