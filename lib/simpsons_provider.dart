import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_simpsons_persons/screens/list_person_simpsons.dart';
import 'package:the_simpsons_persons/screens/search_name_simpsons.dart';

import 'bloc/cubit_simpsons.dart';
import 'json_character/json_character.dart';

class SimpsonsProvider extends StatefulWidget {
  const SimpsonsProvider({Key? key}) : super(key: key);

  @override
  State<SimpsonsProvider> createState() => _SimpsonsProviderState();
}

class _SimpsonsProviderState extends State<SimpsonsProvider> {
  List<CharacterList> characterList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitSimpsons()..loadingPersons(),
      child: BlocConsumer<CubitSimpsons, StateSimpsons>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ListPersonSimpsonsState) {
            return ListPersonSimpsons(state.characterList);
          }
          if (state is SearchNameSimpsonsState) {
            return  SearchNameSimpsons();
          }
          if (state is Error) {
            return Center(
              child: CupertinoAlertDialog(
                title: Text(
                  state.message,
                  style: TextStyle(color: Colors.red),
                ),
                content: const Image(
                  image: AssetImage('assets/simpsons_no_network.jpeg'),
                ),
                actions: [
                  CupertinoDialogAction(
                      child: const Text(
                        'Retry',
                      ),
                      onPressed:() {
                        context.read<CubitSimpsons>().loadingPersons();
                      },
                      ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
