import 'package:capitulo09_persistencia_e_anim/local_persistence/daos/palavra_dao.dart';
import 'package:capitulo09_persistencia_e_anim/models/palavra_model.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/bloc/listview/palavras_listview_event.dart';
import 'package:capitulo09_persistencia_e_anim/routes/palavras/bloc/listview/palavras_listview_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class PalavrasListViewBloc
    extends Bloc<PalavrasListViewBlocEvent, PalavrasListViewBlocState> {
  final PalavraDAO palavraDAO;
  bool _hasReachedMax(PalavrasListViewBlocState state) =>
      state is PalavrasListViewLoaded && state.hasReachedMax;

  PalavrasListViewBloc({@required this.palavraDAO})
      : assert(palavraDAO != null);

  @override
  Stream<PalavrasListViewBlocState> transformEvents(
    Stream<PalavrasListViewBlocEvent> events,
    Stream<PalavrasListViewBlocState> Function(PalavrasListViewBlocEvent event)
        next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  get initialState => PalavrasListViewBlocUninitialized();

  Future<List<PalavraModel>> _fetchPalavras(int startIndex, int limit) async {
    try {
      final List data =
          await this.palavraDAO.getAll(startIndex: startIndex, limit: limit);
      return data.map((palavra) {
        return PalavraModel.fromJson(palavra);
      }).toList();
    } catch (exception) {
      rethrow;
    }
  }

  @override
  Stream<PalavrasListViewBlocState> mapEventToState(
      PalavrasListViewBlocEvent event) async* {
    final currentState = state;

    if (event is PalavrasListViewBlocEventResetFetch) {
      yield PalavrasListViewBlocUninitialized();
      return;
    }

    if (event is PalavrasListViewBlocEventConfirmDismiss &&
        currentState is PalavrasListViewLoaded) {
      currentState.palavras.removeAt(event.indexOfDismissible);
      yield PalavrasListViewLoaded(
          palavras: currentState.palavras,
          hasReachedMax: currentState.hasReachedMax);
      return;
    }

    if (event is PalavrasListViewBlocEventFetch &&
        !_hasReachedMax(currentState)) {
      try {
        if (currentState is PalavrasListViewBlocUninitialized) {
          final palavras = await _fetchPalavras(0, 20);
          yield PalavrasListViewLoaded(
              palavras: palavras, hasReachedMax: false);
          return;
        }
        if (currentState is PalavrasListViewLoaded) {
          final palavras =
              await _fetchPalavras(currentState.palavras.length, 20);
          yield palavras.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PalavrasListViewLoaded(
                  palavras: currentState.palavras + palavras,
                  hasReachedMax: false,
                );
        }
      } catch (exception) {
        yield PalavrasListViewBlocError(errorMessage: exception);
      }
    }
  }
}
