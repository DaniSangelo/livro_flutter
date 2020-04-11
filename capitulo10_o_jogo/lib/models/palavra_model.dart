import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'palavra_model.g.dart';

/// flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class PalavraModel extends Equatable {
  String palavraID;
  String palavra;
  String ajuda;

  @override
  List<Object> get props => [palavraID];

  PalavraModel({this.palavraID, this.palavra, this.ajuda});

  factory PalavraModel.fromJson(Map<String, dynamic> json) =>
      _$PalavraModelFromJson(json);
  Map<String, dynamic> toJson() => _$PalavraModelToJson(this);
}
