import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit_simpsons.dart';

class SearchNameSimpsons extends StatelessWidget {
  SearchNameSimpsons({Key? key}) : super(key: key);

  late String name;

  // Color colors =  3a9782;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BFA5),
        title: const Text('Search', style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 35,
          color: Colors.yellow,
          fontFamily: 'MsMadi',
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.yellow,
            size: 35,
          ),
          onPressed: () {
            context.read<CubitSimpsons>().loadingPersons();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
             // opacity: 0.3,
            image: AssetImage('assets/simpsons1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AlertDialog(
            title: const Text(
              'Enter Name Character',
              style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.yellow,
                fontSize: 30,
              ),
            ),
            content: TextField(
                cursorColor: Colors.redAccent,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter Name Character',
                  hintStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.5),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide.none),
                ),
                onChanged: (value) {
                  name = value;
                }),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'Search',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 35),
                ),
                onPressed: () {
                  // context.read<CubitSimpsons>().loadingPersons();
                },
              ),
            ],
            backgroundColor: Colors.black.withOpacity(0.05),
          ),
        ),
      ),
    );
  }
}
