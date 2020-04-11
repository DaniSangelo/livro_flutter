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
  String palavraAdivinhada = '';
  int quantidadeErros = 0;

  @observable
  bool ganhou = false;

  @observable
  bool perdeu = false;

  @observable
  String animacaoFlare = 'idle';

  @observable
  String palavraParaAdivinhar;

  @observable
  String ajudaPalavraParaAdivinhar;

  @observable
  String palavraAdivinhadaFormatada = '';

  _palavraAdivinhadaFormatada() {
    String palavraFormatada = '';
    for (int i = 0; i < this.palavraAdivinhada.length; i++) {
      palavraFormatada = palavraFormatada + this.palavraAdivinhada[i] + ' ';
    }
    return palavraFormatada;
  }

  @action
  registrarErro() {
    quantidadeErros++;
    if (this.quantidadeErros == 1)
      this.animacaoFlare = 'cadeira';
    else if (this.quantidadeErros == 2)
      this.animacaoFlare = 'corpo';
    else if (this.quantidadeErros == 3)
      this.animacaoFlare = 'cabeca';
    else if (this.quantidadeErros == 4)
      this.animacaoFlare = 'balanco';
    else if (this.quantidadeErros == 5)
      this.animacaoFlare = 'enforcamento';
    else if (this.quantidadeErros == 6) this.animacaoFlare = 'balanco';
  }

  @action
  _registrarPalavraParaAdivinhar({String palavra, String ajuda}) {
    this.palavraParaAdivinhar = palavra.toUpperCase();
    this.ajudaPalavraParaAdivinhar = ajuda;
    this.palavraAdivinhada = _transformarPalavraParaAdivinhar();
    this.palavraAdivinhadaFormatada = _palavraAdivinhadaFormatada();
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
    this.animacaoFlare = 'inicio';
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
      registrarErro();
      return;
    }

    while (indexOfWord >= 0) {
      this.palavraAdivinhada =
          this.palavraAdivinhada.replaceFirst('_', letra, indexOfWord);

      indexOfWord = this.palavraParaAdivinhar.indexOf(letra, (indexOfWord + 1));
    }

    this.palavraAdivinhadaFormatada = _palavraAdivinhadaFormatada();

    if (this.palavraAdivinhada.indexOf('_', 0) < 0) this.ganhou = true;
  }
}
