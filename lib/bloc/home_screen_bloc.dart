import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemons/bloc/base_bloc.dart';
import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:flutter_pokemons/screens/pokemon_screen.dart';
import 'package:flutter_pokemons/services/api_service.dart';

class HomeScreenBloc extends BaseBloc {
  int counter = 0;
  bool isLoading = true;
  Uri? next;
  List<Pokemon> pokemons = [];
  ScrollController scrollController = ScrollController();

  HomeScreenBloc() {
    getPokemons();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        getPokemons();
      }
    });
  }

  void getPokemons() {
    isLoading = true;
    input.add(isLoading);
    ApiService.getPokemons(
      uri: next,
    ).then((value) {
      next = Uri.parse(Uri.encodeFull(value["next"]));
      pokemons += value["pokemons"];
    }).catchError((error) {
      next = null;
      pokemons = [];
    }).whenComplete(() {
      isLoading = false;
      input.add(pokemons);
      input.add(isLoading);
    });
  }

  goToPokemon(BuildContext context, String pokemonName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PokemonScreen(name: pokemonName),
      ),
    );
  }
}
