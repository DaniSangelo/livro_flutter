import 'package:flutter/material.dart';

abstract class PalavrasCrudFormEvent {
  const PalavrasCrudFormEvent();
}

class PalavraChanged extends PalavrasCrudFormEvent {
  final String word;

  const PalavraChanged({@required this.word});
}

class AjudaChanged extends PalavrasCrudFormEvent {
  final String help;

  const AjudaChanged({@required this.help});
}

class FormSuccessSubmitted extends PalavrasCrudFormEvent {}

class FormReset extends PalavrasCrudFormEvent {}
