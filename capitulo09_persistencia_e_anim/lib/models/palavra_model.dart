import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'palavra_model.g.dart';

// flutter packages pub run build_runner build
@JsonSerializable()
class PalavraModel extends Equatable {
  String palavraId;
  String palavra;
  String ajuda;

  @override
  List<Object> get props => [palavraId];

  PalavraModel({this.palavraId, this.palavra, this.ajuda});

  factory PalavraModel.fromJson(Map<String, dynamic> json) =>
      _$PalavraModelFromJson(json);
  Map<String, dynamic> toJson() => _$PalavraModelToJson(this);
}
