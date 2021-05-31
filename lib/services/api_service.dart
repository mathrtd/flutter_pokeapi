import 'dart:convert';
import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _api = "https://pokeapi.co/api/v2";
  static final Map<String, String> _headers = {'Content-Type': 'application/json'};

  static Future<Map<String, dynamic>> getPokemons({Uri? uri}) async {
    final resp = await http.get(
      uri ?? Uri.parse(Uri.encodeFull("$_api/pokemon")),
      headers: _headers,
    );
    if (resp.statusCode == 200) {
      final _body = json.decode(resp.body);
      return {
        "next": _body["next"],
        "previous": _body["previous"],
        "pokemons": pokemonsFromJson(_body['results']),
      };
    } else {
      throw (json.decode(resp.body)['messages']);
    }
  }

  static Future<Pokemon> getPokemon(String pokemonName) async {
    final resp = await http.get(
      Uri.parse(Uri.encodeFull("$_api/pokemon/$pokemonName")),
      headers: _headers,
    );
    if (resp.statusCode == 200) {
      final _body = json.decode(resp.body);
      return Pokemon.fromJson(_body);
    } else {
      throw (json.decode(resp.body)['messages']);
    }
  }
}
