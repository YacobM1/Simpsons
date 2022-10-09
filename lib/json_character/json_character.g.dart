// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterList _$CharacterListFromJson(Map<String, dynamic> json) =>
    CharacterList(
      quote: json['quote'] as String,
      character: json['character'] as String,
      image: json['image'] as String,
      characterDirection: json['characterDirection'] as String,
    );

Map<String, dynamic> _$CharacterListToJson(CharacterList instance) =>
    <String, dynamic>{
      'quote': instance.quote,
      'character': instance.character,
      'image': instance.image,
      'characterDirection': instance.characterDirection,
    };
