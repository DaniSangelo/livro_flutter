import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mixins/jogo_mixin.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/jogo_store.dart';
import 'package:capitulo10ojogo/routes/jogo/widgets/letra_teclado_jogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> with JogoMixin {
  JogoStore _jogoStore;
  String letrasParaTeclado = 'ABCDEFGHIJKLMNOPQRSTUWXYZ';
  List<LetraTecladoJogoWidget> widgetsDeLetrasDoTeclado =
      List<LetraTecladoJogoWidget>();

  @override
  void initState() {
    super.initState();
    _jogoStore = getIt.get<JogoStore>();
    for (int i = 0; i < letrasParaTeclado.length; i++) {
      widgetsDeLetrasDoTeclado.add(
        LetraTecladoJogoWidget(
          letra: this.letrasParaTeclado[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                titulo(),
                botaoParaSorteioDePalavra(
                  onPressed: () =>
                      this._jogoStore.selecionarPalavraParaAdivinhar(),
                ),
                palavraParaAdivinhar(
                    palavra: this._jogoStore.palavraAdivinhada),
                ajudaParaAdivinharAPalavra(
                    ajuda: this._jogoStore.ajudaPalavraParaAdivinhar),
                animacaoDaForca(animacao: 'idle'),
                exibirTecladoParaJogo(letras: this.widgetsDeLetrasDoTeclado),
              ],
            );
          },
        ),
      ),
    );
  }
}
