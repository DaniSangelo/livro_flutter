import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/teclado_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TecladoJogoWidget extends StatefulWidget {
  @override
  _TecladoJogoWidgetState createState() => _TecladoJogoWidgetState();
}

class _TecladoJogoWidgetState extends State<TecladoJogoWidget> {
  String letrasParaTeclado = 'ABCDEFGHIJKLMNOPQRSTUWXYZ';
  TecladoStore _tecladoStore;

  @override
  void initState() {
    super.initState();
    _tecladoStore = getIt.get<TecladoStore>();
    _tecladoStore.inicializarTeclado(letrasParaTeclado: letrasParaTeclado);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Observer(
          builder: (_) {
            return Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 5,
              children: _gerarTeclado(_tecladoStore.widgetsDeLetrasDoTeclado),
            );
          },
        ));
  }

  _gerarTeclado(teste) {
    var teclado = List<Widget>();
    for (int i = 0; i < _tecladoStore.widgetsDeLetrasDoTeclado.length; i++) {
      teclado.add(InkWell(
        onTap: () {
          print(_tecladoStore.widgetsDeLetrasDoTeclado[i].letra);
          _tecladoStore.letraPressionada(indiceDaLetra: i);
        },
        child: _tecladoStore.widgetsDeLetrasDoTeclado[i],
      ));
    }
    return teclado;
  }
}
