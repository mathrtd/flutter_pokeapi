import 'dart:convert';

List<PokemonType> pokemonTypesFromJson(List<dynamic> pokemonTypes) => pokemonTypes.map((e) => PokemonType.fromJson(e)).toList();
PokemonType pokemonTypeFromJson(String str) => PokemonType.fromJson(json.decode(str));
String pokemonTypeToJson(PokemonType data) => json.encode(data.toJson());
Type statFromJson(String str) => Type.fromJson(json.decode(str));
String statToJson(Type data) => json.encode(data.toJson());

class Type {
  Type({
    this.name,
    this.url,
  });
  String? name, url;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class PokemonType {
  PokemonType({
    this.slot,
    this.type,
  });

  int? slot;
  Type? type;

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: json["type"] == null ? null : Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type!.toJson(),
      };
}
