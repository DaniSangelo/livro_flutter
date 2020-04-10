import 'package:capitulo10ojogo/routes/jogo/widgets/letra_teclado_jogo_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'teclado_store.g.dart';

/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner build --delete-conflicting-outputs
/// flutter packages pub run build_runner watch

class TecladoStore = _TecladoStore with _$TecladoStore;

abstract class _TecladoStore with Store {
  @observable
  ObservableList<LetraTecladoJogoWidget> widgetsDeLetrasDoTeclado =
      ObservableList<LetraTecladoJogoWidget>();

  @action
  inicializarTeclado({String letrasParaTeclado}) {
    for (int i = 0; i < letrasParaTeclado.length; i++) {
      widgetsDeLetrasDoTeclado.add(
        LetraTecladoJogoWidget(
          letra: letrasParaTeclado[i],
        ),
      );
    }
  }

  @action
  letraPressionada({int indiceDaLetra}) {
    widgetsDeLetrasDoTeclado[indiceDaLetra] =
        widgetsDeLetrasDoTeclado[indiceDaLetra].copyWith(
      letra: widgetsDeLetrasDoTeclado[indiceDaLetra].letra,
      foiUtilizada: true,
    );
  }
}
