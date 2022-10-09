import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../json_character/json_character.dart';
import '../services/network_simpsons_api.dart';

part 'state_simpsons.dart';



class CubitSimpsons extends Cubit<StateSimpsons> {
  CubitSimpsons() : super(Loading());

  // Future<void> searchNamePersons()  async {
  //   final String name = name;
  //   try {
  //     final List<CharacterList> characterList = await getNameList();
  //     emit(ListPersonSimpsonsState(characterList: characterList));
  //   } catch (e) {
  //     emit(const Error(message: 'No Network'));
  //   }
  // }


  Future<void> loadingPersons()  async {
      try {
        final List<CharacterList> characterList = await getCharacterList();
        emit(ListPersonSimpsonsState(characterList: characterList));
      } catch (e) {
        emit(const Error(message: 'No Network'));
      }
  }

  // Future<void> loadingFirstPage() async {
  //   try {
  //     await loadingImages(page);
  //     emit(HomeScreenState(listElement));
  //   } catch (e) {
  //     emit(const Error(message: 'No Network'));
  //   }
  // }
}