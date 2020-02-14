import 'package:flutter_bloc/flutter_bloc.dart';
import 'palavras_crud_form_event.dart';
import 'palavras_crud_form_state.dart';

class PalavrasCrudFormBloc
    extends Bloc<PalavrasCrudFormEvent, PalavrasCrudFormState> {
  @override
  PalavrasCrudFormState get initialState => PalavrasCrudFormState.initial();

  @override
  Stream<PalavrasCrudFormState> mapEventToState(
    PalavrasCrudFormEvent event,
  ) async* {
    if (event is PalavraChanged) {
      yield state.copyWith(
        palavra: event.word,
        isPalavraValid: _isPalavraValid(event.word),
      );
    } else if (event is AjudaChanged) {
      yield state.copyWith(
        ajuda: event.help,
        isAjudaValid: _isAjudaValid(event.help),
      );
    } else if (event is FormSuccessSubmitted) {
      yield state.copyWith(formSubmittedSuccessfully: true);
    } else if (event is FormReset) {
      yield PalavrasCrudFormState.initial();
    }
  }

  bool _isPalavraValid(String palavra) {
    return palavra.isNotEmpty;
  }

  bool _isAjudaValid(String ajuda) {
    return ajuda.isNotEmpty;
  }
}
