import 'package:json_annotation/json_annotation.dart';
part 'json_character.g.dart';

@JsonSerializable()
class CharacterList {
  final String quote;
  final String character;
  final String image;
  final String characterDirection;

  CharacterList(
      {required this.quote,
      required this.character,
      required this.image,
      required this.characterDirection});

  factory CharacterList.fromJson (Map<String, dynamic> json) => _$CharacterListFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterListToJson(this);
}
