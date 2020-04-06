import 'dart:math';

import 'package:capitulo10ojogo/local_persistence/daos/palavra_dao.dart';
import 'package:capitulo10ojogo/models/palavra_model.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class JogoRoute2 extends StatefulWidget {
  @override
  _JogoRoute2State createState() => _JogoRoute2State();
}

class _JogoRoute2State extends State<JogoRoute2> {
  String letras = 'ABCDEFGHIJKLMNOPQRSTUWXYZ';
  String palavraParaAdivinhar;
  String palavraAdivinhada;
  List<LetraDoTeclado> letrasDoTeclado = List<LetraDoTeclado>();
  int quantidadeErros = 0;
  String animacaoFlare = 'idle';

  @override
  void initState() {
    for (int i = 0; i < letras.length; i++)
      letrasDoTeclado.add(LetraDoTeclado(letra: this.letras[i]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
              this.palavraParaAdivinhar == null
                  ? Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      height: 50,
                      child: FlatButton(
                        child: Text('Sorteie a palavra'),
                        color: Colors.blue[200],
                        onPressed: () async => await _getTheWordToGame(),
                      ),
                    )
                  : Container(
                      height: 50,
                    ),
              this.palavraParaAdivinhar != null
                  ? this._drawSpacesToPlay()
                  : Container(
                      height: 30,
                    ),
              Expanded(
                child: FlareActor(
                  "assets/flare/forca_casa_do_codigo.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: animacaoFlare,
                ),
              ),
              Visibility(
                visible: this.palavraParaAdivinhar != null,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: this._generateKeyBoard(),
              ),
//              this.palavraParaAdivinhar != null
//                  ? this._generateKeyBoard()
//                  : Container(
//                      height: 80,
//                    ),
//              _generateKeyBoard(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
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

    print(2);

    for (int i = indexStart; i <= indexEnd && i < letras.length; i++) {
      print(4);
      textsOfWords.add(GestureDetector(
        onTap: () {
          if (!letrasDoTeclado[i].wasPressed) _wordPressed(word: letras[i]);
        },
        child: Text(
          letrasDoTeclado[i].letra,
          style: TextStyle(
            fontSize: 30,
            color: letrasDoTeclado[i].wasPressed ? Colors.red : Colors.black,
          ),
        ),
//        letrasDoTeclado[i],
      ));
      textsOfWords.add(SizedBox(
        width: 15,
      ));
    }
    return textsOfWords;
  }

  _wordPressed({String word}) {
    print(this.palavraParaAdivinhar);

    int indexOfWord = this.palavraParaAdivinhar.indexOf(word, 0);
    if (indexOfWord < 0) {
      this.quantidadeErros++;
      _atualizarAnimacao();
      return;
    }

    while (indexOfWord >= 0) {
      setState(() {
        this.palavraAdivinhada =
            this.palavraAdivinhada.replaceFirst('_', word, indexOfWord);
      });
      print(this.palavraAdivinhada);
      indexOfWord = this.palavraParaAdivinhar.indexOf(word, (indexOfWord + 1));
    }

    for (int i = 0; i < this.letrasDoTeclado.length; i++) {
      if (this.letrasDoTeclado[i].letra == word) {
        setState(() {
          this.letrasDoTeclado[i].wasPressed = true;
        });
      }
    }
  }
  this.palavraAdivinhada = '';
  print('Adivinhar: ${this.palavraParaAdivinhar}');
  for (int i = 0; i < this.palavraParaAdivinhar.length; i++) {
  if (this.palavraParaAdivinhar[i] != ' ')
  this.palavraAdivinhada = this.palavraAdivinhada.substring(0) + '_';
  else
  this.palavraAdivinhada = this.palavraAdivinhada.substring(0) + ' ';
  print('Adivinhada: ${this.palavraAdivinhada}');
  }
  _getTheWordToGame() async {
    List<PalavraModel> palavras = await _fetchPalavras();
    var random = new Random();
    setState(() {
      this.palavraParaAdivinhar =
          palavras[random.nextInt(palavras.length)].palavra.toUpperCase();
    });
    _createPalavraAdivinhada();
    _atualizarAnimacao();
  }

  _atualizarAnimacao() {
    print('erros: $quantidadeErros');
    setState(() {
      if (this.quantidadeErros == 0)
        this.animacaoFlare = 'inicio';
      else if (this.quantidadeErros == 1)
        this.animacaoFlare = 'cadeira';
      else if (this.quantidadeErros == 2)
        this.animacaoFlare = 'corpo';
      else if (this.quantidadeErros == 3)
        this.animacaoFlare = 'cabeca';
      else if (this.quantidadeErros == 4)
        this.animacaoFlare = 'balanco';
      else if (this.quantidadeErros == 5)
        this.animacaoFlare = 'enforcamento';
      else if (this.quantidadeErros == 4) this.animacaoFlare = 'balanco';
    });
  }

  _createPalavraAdivinhada() {

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
    for (int i = 0; i < this.palavraAdivinhada.length; i++) {
      spacesToWord.add(Text(
        this.palavraAdivinhada[i],
//        this.palavraParaAdivinhar[i] == ' ' ? ' ' : '_',
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

class LetraDoTeclado extends StatefulWidget {
  final String letra;
  bool wasPressed;

  LetraDoTeclado({this.letra, this.wasPressed = false});

  @override
  _LetraDoTecladoState createState() => _LetraDoTecladoState();
}

class _LetraDoTecladoState extends State<LetraDoTeclado> {
  @override
  Widget build(BuildContext context) {
    print(3);
    return Text(
      widget.letra,
      style: TextStyle(
        color: widget.wasPressed ? Colors.red : Colors.black,
        fontSize: 30,
      ),
    );
  }
}

//class LetraDoTeclado {
//  final String letra;
//  final bool wasPressed;
//
//  LetraDoTeclado({this.letra, this.wasPressed = false});
//}
