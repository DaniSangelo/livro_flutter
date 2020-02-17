import 'package:capitulo09_persistencia_e_anim/models/palavra_model.dart';

abstract class PalavrasListViewBlocEvent {}

class PalavrasListViewBlocEventFetch extends PalavrasListViewBlocEvent {}

class PalavrasListViewBlocEventResetFetch extends PalavrasListViewBlocEvent {}

class PalavrasListViewBlocEventConfirmDismiss
    extends PalavrasListViewBlocEvent {
  final int indexOfDismissible;

  PalavrasListViewBlocEventConfirmDismiss({
    this.indexOfDismissible,
  });
}

class PalavrasListViewBlocEventFindListTile extends PalavrasListViewBlocEvent {}
