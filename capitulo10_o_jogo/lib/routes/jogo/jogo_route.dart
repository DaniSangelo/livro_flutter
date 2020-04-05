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
  List<ReactionDisposer> _reactionDisposers;
  bool _jogoIniciado = false;
  String _ajudaParaPalavra = '';

  @override
  void initState() {
    super.initState();
    _jogoStore = getIt.get<JogoStore>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reactionDisposers ??= [
      reaction(
        (_) => _jogoStore.palavraParaAdivinhar,
        (String palavra) => print('nova palavra: $palavra'),
      ),
      reaction(
        (_) => _jogoStore.ajudaPalavraParaAdivinhar,
        (String ajuda) {
          print('nova ajuda: $ajuda');
          setState(() {
            this._jogoIniciado = !this._jogoIniciado;
            this._ajudaParaPalavra = ajuda;
          });
        },
      ),
    ];
  }

  @override
  void dispose() {
    _reactionDisposers.forEach((d) => d());
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
            Visibility(
              visible: !this._jogoIniciado,
              child: botaoParaSorteioDePalavra(
                onPressed: () => this._jogoStore.registrarPalavraParaAdivinhar(
                    palavra: 'teste', ajuda: 'ajuda para teste'),
              ),
            ),
            palavraParaAdivinhar(palavra: '_____ _____ _ _____'),
            Visibility(
              visible: this._jogoIniciado,
              child: Text(
                this._ajudaParaPalavra,
                textAlign: TextAlign.center,
              ),
            ),
            animacaoDaForca(animacao: 'idle'),
            letrasParaSeleccao(letras: 'ABCDEFGHIJKLMNOPQRSTUWXYZ'),
          ],
        ),
      ),
    );
  }
}
