import 'package:capitulo10ojogo/functions/getit_function.dart';
import 'package:capitulo10ojogo/routes/jogo/mixins/jogo_mixin.dart';
import 'package:capitulo10ojogo/routes/jogo/mobx_stores/jogo_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> with JogoMixin {
  JogoStore _jogoStore;
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _jogoStore = getIt.get<JogoStore>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _disposers ??= [
      reaction(
        (_) => _jogoStore.palavraParaAdivinhar,
        (String palavra) {
          print('nova palavra: $palavra');
        },
      ),
      reaction(
        (_) => _jogoStore.ajudaPalavraParaAdivinhar,
        (String ajuda) {
          print('nova ajuda: $ajuda');
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titulo(),
            botaoParaSorteioDePalavra(
              onPressed: () => this._jogoStore.registrarPalavraParaAdivinhar(
                  palavra: 'teste', ajuda: 'ajuda para teste'),
            ),
            palavraParaAdivinhar(palavra: '_____ _____ _ _____'),
            animacaoDaForca(animacao: 'idle'),
            letrasParaSeleccao(letras: 'ABCDEFGHIJKLMNOPQRSTUWXYZ'),
          ],
        ),
      ),
    );
  }
}
