import 'dart:convert';

import '../json_character/json_character.dart';
import 'package:http/http.dart' as http;


Future<List<CharacterList>> getCharacterList() async {
  final uri = Uri.parse(
      // https://thesimpsonsquoteapi.glitch.me/quotes?count=20
      'https://thesimpsonsquoteapi.glitch.me/quotes?count=20');
  final response = await http.get(uri);
  final data = response.body;

  if (response.statusCode == 200) {
    final q = json.decode(response.body);
    List<CharacterList> posts = List<CharacterList>.from(q.map((model)=> CharacterList.fromJson(model)));
    return posts;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}

Future<List<CharacterList>> getNameList(String name) async {
  final uri = Uri.parse(
    //https://thesimpsonsquoteapi.glitch.me/quotes?character=homer
      'https://thesimpsonsquoteapi.glitch.me/quotes?character=$name');
  final response = await http.get(uri);
  final data = response.body;

  if (response.statusCode == 200) {
    final q = json.decode(response.body);
    List<CharacterList> posts = List<CharacterList>.from(q.map((model)=> CharacterList.fromJson(model)));
    return posts;
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}