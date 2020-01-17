// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'palavra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PalavraModel _$PalavraModelFromJson(Map<String, dynamic> json) {
  return PalavraModel(
    palavraId: json['palavraId'] as String,
    palavra: json['palavra'] as String,
    ajuda: json['ajuda'] as String,
  );
}

Map<String, dynamic> _$PalavraModelToJson(PalavraModel instance) =>
    <String, dynamic>{
      'palavraId': instance.palavraId,
      'palavra': instance.palavra,
      'ajuda': instance.ajuda,
    };
