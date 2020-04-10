import 'dart:math';

import 'package:capitulo10ojogo/local_persistence/daos/palavra_dao.dart';
import 'package:capitulo10ojogo/models/palavra_model.dart';
import 'package:mobx/mobx.dart';

part 'jogo_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class JogoStore = _JogoStore with _$JogoStore;

abstract class _JogoStore with Store {
  List<PalavraModel> _palavrasRegistradas = [];

  @observable
  String palavraParaAdivinhar;

  @observable
  String ajudaPalavraParaAdivinhar;

//  @observable
  String palavraAdivinhada = '';

//  @observable
//  String palavraAdivinhadaFormatada = '';
//
  @computed
  String get palavraAdivinhadaFormatada => _palavraAdivinhadaFormatada();

  _palavraAdivinhadaFormatada() {
    String palavraFormatada = '';
    for (int i = 0; i < this.palavraAdivinhada.length; i++) {
      palavraFormatada = palavraFormatada + this.palavraAdivinhada[i] + ' ';
    }
    return palavraFormatada;
  }

  @action
  _registrarPalavraParaAdivinhar({String palavra, String ajuda}) {
    this.palavraParaAdivinhar = palavra.toUpperCase();
    this.ajudaPalavraParaAdivinhar = ajuda;
    this.palavraAdivinhada = _transformarPalavraParaAdivinhar();
  }

  selecionarPalavraParaAdivinhar() async {
    if (this._palavrasRegistradas.length == 0)
      this._palavrasRegistradas = await _carregarPalavras();

    var random = new Random();
    int indiceSorteado = random.nextInt(this._palavrasRegistradas.length);
    PalavraModel palavraSelecionada = this._palavrasRegistradas[indiceSorteado];

    _registrarPalavraParaAdivinhar(
        palavra: palavraSelecionada.palavra, ajuda: palavraSelecionada.ajuda);

    this._palavrasRegistradas.removeAt(indiceSorteado);
  }

  Future<List<PalavraModel>> _carregarPalavras() async {
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

  _transformarPalavraParaAdivinhar() {
    String palavraFormatada = '';
    for (int i = 0; i < this.palavraParaAdivinhar.length; i++) {
      if (this.palavraParaAdivinhar[i] != ' ')
        palavraFormatada = palavraFormatada + '_';
      else
        palavraFormatada = palavraFormatada + ' ';
    }
    return palavraFormatada;
  }

  @action
  verificarExistenciaDaLetraNaPalavraParaAdivinhar({String letra}) {
    int indexOfWord = this.palavraParaAdivinhar.indexOf(letra, 0);
    if (indexOfWord < 0) {
      return;
    }

    while (indexOfWord >= 0) {
      this.palavraAdivinhada =
          this.palavraAdivinhada.replaceFirst('_', letra, indexOfWord);

      indexOfWord = this.palavraParaAdivinhar.indexOf(letra, (indexOfWord + 1));
    }
  }
}
