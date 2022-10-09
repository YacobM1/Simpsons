part of 'cubit_simpsons.dart';

abstract class StateSimpsons extends Equatable {
  const StateSimpsons ();

  @override
  List<CharacterList> get props => [];
}

class SearchNameSimpsonsState extends StateSimpsons {

  final String name;

  const SearchNameSimpsonsState({required this.name});

  @override
  List<CharacterList> get props => [];
}

class ListPersonSimpsonsState extends StateSimpsons {

  final List<CharacterList> characterList;

  const ListPersonSimpsonsState({required this.characterList});

  @override
  List<CharacterList> get props => [];
}

class Error extends StateSimpsons {
  final String message;

  const Error({required this.message});

}

class Loading extends StateSimpsons {}

class InfoPersonsSimpsons extends StateSimpsons{
  // final String

}