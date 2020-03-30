import 'dart:math';

import 'package:capitulo10ojogo/local_persistence/daos/palavra_dao.dart';
import 'package:capitulo10ojogo/models/palavra_model.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class JogoRoute extends StatefulWidget {
  @override
  _JogoRouteState createState() => _JogoRouteState();
}

class _JogoRouteState extends State<JogoRoute> {
  String letras = 'ABCDEFGHIJKLMNOPQRSTUWXYZ';
  String palavraParaAdivinhar;
  String palavraAdivinhada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Vamos jogar a Forca?',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            FlatButton(
              child: Text('Sorteie a palavra'),
              color: Colors.blue[200],
              onPressed: () async => await _getTheWordToGame(),
            ),
            this.palavraParaAdivinhar != null
                ? this._drawSpacesToPlay()
                : Container(),
//            Visibility(
//              visible: this.palavraParaAdivinhar != null,
//              child: this._drawSpacesToPlay(),
//            ),
            Expanded(
              child: FlareActor(
                "assets/flare/forca_casa_do_codigo.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "idle",
              ),
            ),
            _generateKeyBoard(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  _generateKeyBoard() {
    return Column(
      children: _generateRowToKeyboard(),
    );
  }

  List<Widget> _generateRowToKeyboard() {
    List<Widget> rowsOfWords = List<Widget>();
    rowsOfWords.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateLineToRow(indexStart: 0, indexEnd: 8),
    ));
    rowsOfWords.add(SizedBox(
      height: 10,
    ));
    rowsOfWords.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateLineToRow(indexStart: 9, indexEnd: 17),
    ));
    rowsOfWords.add(SizedBox(
      height: 10,
    ));
    rowsOfWords.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _generateLineToRow(indexStart: 18, indexEnd: 29),
    ));
    return rowsOfWords;
  }

  List<Widget> _generateLineToRow({int indexStart, int indexEnd}) {
    List<Widget> textsOfWords = List<Widget>();
    for (int i = indexStart; i <= indexEnd && i < letras.length; i++) {
      textsOfWords.add(GestureDetector(
        onTap: () => _wordPressed(word: letras[i]),
        child: Text(
          letras[i],
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ));
      textsOfWords.add(SizedBox(
        width: 15,
      ));
    }
    return textsOfWords;
  }

  _wordPressed({String word}) {
    print(word);
  }

  _getTheWordToGame() async {
    List<PalavraModel> palavras = await _fetchPalavras();
    var random = new Random();
    setState(() {
      this.palavraParaAdivinhar =
          palavras[random.nextInt(palavras.length)].palavra;
    });
    _createPalavraAdivinhada();
  }

  _createPalavraAdivinhada() {
    this.palavraAdivinhada = '';
    print('Adivinhar: ${this.palavraParaAdivinhar}');
    for (int i = 0; i < this.palavraParaAdivinhar.length; i++) {
      if (this.palavraParaAdivinhar[i] != ' ')
        this.palavraAdivinhada = this.palavraAdivinhada.substring(0) + '_';
      else
        this.palavraAdivinhada = this.palavraAdivinhada.substring(0) + ' ';
      print('Adivinhada: ${this.palavraAdivinhada}');
    }
  }

  Future<List<PalavraModel>> _fetchPalavras() async {
    try {
      PalavraDAO palavraDAO = PalavraDAO();
      final List data = await palavraDAO.getAll();
      return data.map((palavra) {
        return PalavraModel.fromJson(palavra);
      }).toList();
    } catch (exception) {
      rethrow;
    }
  }

  Row _drawSpacesToPlay() {
    List<Widget> spacesToWord = List<Widget>();
    for (int i = 0; i < this.palavraParaAdivinhar.length; i++) {
      spacesToWord.add(Text(
        this.palavraParaAdivinhar[i] == ' ' ? ' ' : '_',
        style: TextStyle(
          fontSize: 30,
        ),
      ));
      spacesToWord.add(SizedBox(
        width: 15,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: spacesToWord,
    );
  }
}
