import 'package:capitulo10ojogo/appconstants/router_constants.dart';
import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mixins/jogo_mixin.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/jogo_store.dart';
import 'package:capitulo10ojogo/routes/jogo/widgets/jogo_terminou_widget.dart';
import 'package:capitulo10ojogo/routes/jogo/widgets/letra_teclado_jogo_widget.dart';
import 'package:capitulo10ojogo/routes/jogo/widgets/teclado_jogo_widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> with JogoMixin {
  JogoStore _jogoStore;

  @override
  void initState() {
    super.initState();
    _jogoStore = getIt.get<JogoStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (this._jogoStore.ganhou) {
              return JogoTerminouWidget(
                urlImagem: "assets/images/jogo/vitoria.jpg",
                mensagem: 'Parabéns pela vitória. Já retornaremos ao jogo.',
              );
            } else if (this._jogoStore.perdeu) {
              print(1);
              return JogoTerminouWidget(
                urlImagem: "assets/images/jogo/derrota.jpg",
                mensagem: 'Que pena, você perdeu, mas já retornaremos ao jogo.',
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: this._jogoStore.palavraAdivinhadaFormatada.isEmpty,
                  child: titulo(),
                ),
                Visibility(
                  visible: this._jogoStore.palavraAdivinhadaFormatada.isEmpty,
                  child: botaoParaSorteioDePalavra(
                    onPressed: () =>
                        this._jogoStore.selecionarPalavraParaAdivinhar(),
                  ),
                ),
                Visibility(
                  visible:
                      this._jogoStore.palavraAdivinhadaFormatada.isNotEmpty,
                  child: palavraParaAdivinhar(
                      palavra: this._jogoStore.palavraAdivinhadaFormatada),
                ),
                Visibility(
                  visible:
                      this._jogoStore.palavraAdivinhadaFormatada.isNotEmpty,
                  child: ajudaParaAdivinharAPalavra(
                      ajuda: this._jogoStore.ajudaPalavraParaAdivinhar),
                ),
                animacaoDaForca(animacao: this._jogoStore.animacaoFlare),
                TecladoJogoWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
