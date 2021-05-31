import 'package:flutter/cupertino.dart';
import 'package:flutter_pokemons/bloc/base_bloc.dart';
import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:flutter_pokemons/services/api_service.dart';

class PokemonScreenBloc extends BaseBloc {
  BuildContext context;
  bool isLoading = true;
  Pokemon? pokemon;
  String pokemonName;

  PokemonScreenBloc(this.context, this.pokemonName) {
    getPokemon();
  }

  void getPokemon() {
    isLoading = true;
    input.add(isLoading);
    ApiService.getPokemon(pokemonName).then((value) {
      pokemon = value;
    }).catchError((error) {
      pokemon = null;
    }).whenComplete(() {
      isLoading = false;
      input.add(pokemon);
      input.add(isLoading);
    });
  }
}
