import 'package:flutter/material.dart';

mixin JogoMixin {
  titulo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Text(
        'Vamos jogar a Forca?',
        style: TextStyle(
          fontSize: 30,
        ),
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
        child: Text('Vamos sortear uma palavra para o Jogo?'),
        color: Colors.blue[200],
        onPressed: () {},
      ),
    );
  }
}
