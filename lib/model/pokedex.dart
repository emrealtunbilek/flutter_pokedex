// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'dart:convert';

Pokedex pokedexFromJson(String str) {
  final jsonData = json.decode(str);
  return Pokedex.fromJson(jsonData);
}

String pokedexToJson(Pokedex data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Pokedex {
  List<Pokemon> pokemon;

  Pokedex({
    this.pokemon,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => new Pokedex(
    pokemon: json["pokemon"] == null ? null : new List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pokemon": pokemon == null ? null : new List<dynamic>.from(pokemon.map((x) => x.toJson())),
  };
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double> multipliers;
  List<String> weaknesses;
  List<Evolution> nextEvolution;
  List<Evolution> prevEvolution;

  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => new Pokemon(
    id: json["id"] == null ? null : json["id"],
    num: json["num"] == null ? null : json["num"],
    name: json["name"] == null ? null : json["name"],
    img: json["img"] == null ? null : json["img"],
    type: json["type"] == null ? null : new List<String>.from(json["type"].map((x) => x)),
    height: json["height"] == null ? null : json["height"],
    weight: json["weight"] == null ? null : json["weight"],
    candy: json["candy"] == null ? null : json["candy"],
    candyCount: json["candy_count"] == null ? null : json["candy_count"],
    egg: json["egg"] == null ? null : json["egg"],
    spawnChance: json["spawn_chance"] == null ? null : json["spawn_chance"].toDouble(),
    avgSpawns: json["avg_spawns"] == null ? null : json["avg_spawns"].toDouble(),
    spawnTime: json["spawn_time"] == null ? null : json["spawn_time"],
    multipliers: json["multipliers"] == null ? null : new List<double>.from(json["multipliers"].map((x) => x.toDouble())),
    weaknesses: json["weaknesses"] == null ? null : new List<String>.from(json["weaknesses"].map((x) => x)),
    nextEvolution: json["next_evolution"] == null ? null : new List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
    prevEvolution: json["prev_evolution"] == null ? null : new List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "num": num == null ? null : num,
    "name": name == null ? null : name,
    "img": img == null ? null : img,
    "type": type == null ? null : new List<dynamic>.from(type.map((x) => x)),
    "height": height == null ? null : height,
    "weight": weight == null ? null : weight,
    "candy": candy == null ? null : candy,
    "candy_count": candyCount == null ? null : candyCount,
    "egg": egg == null ? null : egg,
    "spawn_chance": spawnChance == null ? null : spawnChance,
    "avg_spawns": avgSpawns == null ? null : avgSpawns,
    "spawn_time": spawnTime == null ? null : spawnTime,
    "multipliers": multipliers == null ? null : new List<dynamic>.from(multipliers.map((x) => x)),
    "weaknesses": weaknesses == null ? null : new List<dynamic>.from(weaknesses.map((x) => x)),
    "next_evolution": nextEvolution == null ? null : new List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
    "prev_evolution": prevEvolution == null ? null : new List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
  };
}

class Evolution {
  String num;
  String name;

  Evolution({
    this.num,
    this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) => new Evolution(
    num: json["num"] == null ? null : json["num"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "num": num == null ? null : num,
    "name": name == null ? null : name,
  };
}
