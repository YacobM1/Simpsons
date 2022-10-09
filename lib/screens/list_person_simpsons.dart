import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_simpsons_persons/bloc/cubit_simpsons.dart';

import '../json_character/json_character.dart';
import 'info_person_simpsons.dart';

class ListPersonSimpsons extends StatefulWidget {
  const ListPersonSimpsons(this.characterList, {Key? key}) : super(key: key);

  final List<CharacterList> characterList;

  @override
  State<ListPersonSimpsons> createState() => _ListPersonSimpsonsState();
}

class _ListPersonSimpsonsState extends State<ListPersonSimpsons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/ru/thumb/1/1b/Simpsons.png/274px-Simpsons.png'),
        ),
        backgroundColor: const Color(0xFF00BFA5),
        centerTitle: true,
        title: const Text(
          'Simpsons',
          style: TextStyle(
              color: Colors.yellow,
              fontFamily: 'MsMadi',
              fontSize: 50,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {
                context.read<CubitSimpsons>().emit( SearchNameSimpsonsState(name: ''));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.yellow,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage('assets/simpsons1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: widget.characterList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListTile(
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => InfoPersonSimpsons(
                            row: widget.characterList[index].quote,
                            name: widget.characterList[index].character,
                            image: widget.characterList[index].image,
                          ),
                        );
                        Navigator.push(context, route);
                      },
                      title: Text(
                        widget.characterList[index].character,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.yellow,
                            fontFamily: 'MsMadi'),
                      ),
                      subtitle: Text(
                        widget.characterList[index].quote,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'FjallaOne'),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: Image(
                          image:
                              NetworkImage(widget.characterList[index].image),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
      ),
    );
  }
}
