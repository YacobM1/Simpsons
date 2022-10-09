import 'package:flutter/material.dart';

class InfoPersonSimpsons extends StatelessWidget {
  const InfoPersonSimpsons(
      {Key? key, required this.name, required this.row, required this.image})
      : super(key: key);

  final String name;
  final String row;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: const Color(0xFF00BFA5),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Container(
              height: 350,
              width: 550,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
            const SizedBox(height: 30),
            Text(name, style: const TextStyle(
              fontSize: 40,
              color: Colors.yellow,
              fontFamily: 'MsMadi',
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(row,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'FjallaOne',
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
