import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokedex"),),
      body: FutureBuilder(future: pokemonlariGetir(),
          builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
            if (gelenPokedex.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else if (gelenPokedex.connectionState == ConnectionState.done) {
//              return GridView.builder(
//                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                      crossAxisCount: 2), itemBuilder: (context, index) {
//                return Text(gelenPokedex.data.pokemon[index].name);
//              });

            return GridView.count(crossAxisCount: 2,children: gelenPokedex.data.pokemon.map((poke) {
              return Text(poke.name);
            }).toList(),);


            }
          }),
    );
  }
}
