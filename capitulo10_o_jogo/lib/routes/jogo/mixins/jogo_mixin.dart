import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

mixin JogoMixin {
  titulo() {
    return _text(
      text: 'Vamos jogar a Forca?',
      edgeInsets: const EdgeInsets.only(
        top: 10.0,
        bottom: 15,
      ),
    );
  }

  botaoParaSorteioDePalavra() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      height: 50,
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.indigo,
            blurRadius: 20.0,
            spreadRadius: 1.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
      child: FlatButton(
        child: Text('Pressione para sortear uma palavra'),
        color: Colors.blue[200],
        onPressed: () {},
      ),
    );
  }

  palavraParaAdivinhar({String palavra}) {
    return _text(
      text: palavra,
      edgeInsets: const EdgeInsets.only(
        top: 20.0,
        bottom: 10,
      ),
    );
  }

  animacaoDaForca({String animacao}) {
    return Expanded(
      child: FlareActor(
        "assets/flare/forca_casa_do_codigo.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: animacao,
      ),
    );
  }

  letrasParaSeleccao({String letras}) {
    List<Widget> textsParaLetras = List<Widget>();

    for (int i = 0; i < letras.length; i++) {
      textsParaLetras.add(Text(
        letras[i],
        style: TextStyle(
          fontSize: 40,
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 5,
        children: textsParaLetras,
      ),
    );
  }

  _text({String text, EdgeInsets edgeInsets}) {
    return Padding(
      padding: edgeInsets,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
