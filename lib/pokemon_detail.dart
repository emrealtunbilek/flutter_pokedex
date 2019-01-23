import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          pokemon.name,
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height * (7 / 10),
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + pokemon.height,
                  ),
                  Text(
                    "Weight : " + pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),

                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null ?
                    pokemon.prevEvolution.map((evolution) => Chip(
                        backgroundColor: Colors.deepOrange.shade300,
                        label: Text(
                          evolution.name,
                          style: TextStyle(color: Colors.white),
                        )))
                        .toList() : [Text("İlk hali")],
                  ),

                  Text(
                    "Next Evolution",
                    style: TextStyle( fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null ?
                      pokemon.nextEvolution.map((evolution) => Chip(
                        backgroundColor: Colors.deepOrange.shade300,
                        label: Text(
                          evolution.name,
                          style: TextStyle(color: Colors.white),
                        )))
                        .toList() : [Text("Son hali")],
                  ),

                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null ?
                    pokemon.weaknesses.map((weakness) => Chip(
                        backgroundColor: Colors.deepOrange.shade300,
                        label: Text(
                          weakness,
                          style: TextStyle(color: Colors.white),
                        )))
                        .toList() : [Text("Zayıflığı yok")],
                  ),

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.contain,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
