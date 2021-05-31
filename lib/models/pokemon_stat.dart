import 'dart:convert';

List<PokemonStat> pokemonStatsFromJson(List<dynamic> pokemonStats) => pokemonStats.map((e) => PokemonStat.fromJson(e)).toList();
PokemonStat pokemonStatFromJson(String str) => PokemonStat.fromJson(json.decode(str));
String pokemonStatToJson(PokemonStat data) => json.encode(data.toJson());
Stat statFromJson(String str) => Stat.fromJson(json.decode(str));
String statToJson(Stat data) => json.encode(data.toJson());

class Stat {
  Stat({
    this.name,
    this.url,
  });
  String? name, url;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class PokemonStat {
  PokemonStat({
    this.baseStat,
    this.stat,
  });

  int? baseStat;
  Stat? stat;

  factory PokemonStat.fromJson(Map<String, dynamic> json) => PokemonStat(
        baseStat: json["base_stat"],
        stat: json['stat'] == null ? null : Stat.fromJson(json['stat']),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "stat": stat!.toJson(),
      };
}
