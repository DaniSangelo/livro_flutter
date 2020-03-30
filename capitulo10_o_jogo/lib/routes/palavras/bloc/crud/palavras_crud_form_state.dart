class PalavrasCrudFormState {
  final String word;
  final bool isWordValid;
  final String help;
  final bool isHelpValid;
  final bool formSubmittedSuccessfully;

  bool get isFormValid => isWordValid && isHelpValid;

  const PalavrasCrudFormState(
      {this.word,
      this.isWordValid,
      this.help,
      this.isHelpValid,
      this.formSubmittedSuccessfully});

  factory PalavrasCrudFormState.initial() {
    return PalavrasCrudFormState(
        word: '',
        isWordValid: false,
        help: '',
        isHelpValid: false,
        formSubmittedSuccessfully: false);
  }

  PalavrasCrudFormState copyWith(
      {String palavra,
      bool isPalavraValid,
      String ajuda,
      bool isAjudaValid,
      bool formSubmittedSuccessfully}) {
    return PalavrasCrudFormState(
        word: palavra ?? this.word,
        isWordValid: isPalavraValid ?? this.isWordValid,
        help: ajuda ?? this.help,
        isHelpValid: isAjudaValid ?? this.isHelpValid,
        formSubmittedSuccessfully:
            formSubmittedSuccessfully ?? this.formSubmittedSuccessfully);
  }
}
