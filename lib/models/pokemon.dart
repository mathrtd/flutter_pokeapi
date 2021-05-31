import 'dart:convert';

import 'package:flutter_pokemons/models/pokemon_stat.dart';
import 'package:flutter_pokemons/models/pokemon_type.dart';

List<Pokemon> pokemonsFromJson(List<dynamic> pokemons) => pokemons.map((e) => Pokemon.fromJson(e)).toList();
Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));
String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    this.id,
    this.url,
    this.defaultSpriteUrl,
    this.name,
    this.height,
    this.weight,
    this.stats,
    this.types,
  });

  int? id, height, weight;
  String? name, url, defaultSpriteUrl;
  List<PokemonStat>? stats;
  List<PokemonType>? types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        url: json["url"],
        defaultSpriteUrl: json['sprites']?['front_default'],
        name: json["name"],
        height: json["height"],
        weight: json["weight"],
        stats: json["stats"] == null ? null : pokemonStatsFromJson(json["stats"]),
        types: json["types"] == null ? null : pokemonTypesFromJson(json["types"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "default_sprite_url": defaultSpriteUrl,
        "name": name,
        "height": height,
        "weight": weight,
        "stats": stats,
        "types": types,
      };

  double heightInMeters() {
    return height! / 10;
  }

  double weightInKilograms() {
    return weight! / 10;
  }

  int idFromUrl() => int.parse(url!.split('/').lastWhere((element) => element != ''));

  String defaultSpriteUrlFromId() => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${idFromUrl()}.png";
}
