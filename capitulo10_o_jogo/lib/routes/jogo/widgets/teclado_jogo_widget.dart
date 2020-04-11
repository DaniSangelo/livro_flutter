import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/jogo_store.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/teclado_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TecladoJogoWidget extends StatefulWidget {
  @override
  _TecladoJogoWidgetState createState() => _TecladoJogoWidgetState();
}

class _TecladoJogoWidgetState extends State<TecladoJogoWidget> {
  String letrasParaTeclado = 'ABCÇDEFGHIJKLMNOPQRSTUWXYZ';
  TecladoStore _tecladoStore;
  JogoStore _jogoStore;

  @override
  void initState() {
    super.initState();
    _tecladoStore = getIt.get<TecladoStore>();
    _jogoStore = getIt.get<JogoStore>();
    _tecladoStore.inicializarTeclado(letrasParaTeclado: letrasParaTeclado);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Observer(
          builder: (_) {
            return Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 5,
              children: _gerarTeclado(),
            );
          },
        ));
  }

  _gerarTeclado() {
    var teclado = List<Widget>();
    for (int i = 0; i < _tecladoStore.widgetsDeLetrasDoTeclado.length; i++) {
      teclado.add(InkWell(
        onTap: (!_tecladoStore.widgetsDeLetrasDoTeclado[i].foiUtilizada)
            ? () {
                _tecladoStore.letraPressionada(indiceDaLetra: i);
                _jogoStore.verificarExistenciaDaLetraNaPalavraParaAdivinhar(
                    letra: _tecladoStore.widgetsDeLetrasDoTeclado[i].letra);
              }
            : null,
        child: _tecladoStore.widgetsDeLetrasDoTeclado[i],
      ));
    }
    return teclado;
  }
}
