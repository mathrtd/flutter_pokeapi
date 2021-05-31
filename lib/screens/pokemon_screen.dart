import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemons/bloc/pokemon_screen_bloc.dart';
import 'package:flutter_pokemons/widgets/loading.dart';
import 'package:flutter_pokemons/widgets/pokemon_details.dart';
import 'package:flutter_pokemons/widgets/refetch.dart';

class PokemonScreen extends StatefulWidget {
  PokemonScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    PokemonScreenBloc bloc = PokemonScreenBloc(context, widget.name);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name.toUpperCase(),
        ),
      ),
      body: StreamBuilder(
        stream: bloc.output,
        builder: (context, snapshot) {
          if (bloc.isLoading && bloc.pokemon == null) {
            return Loading();
          } else if (bloc.pokemon != null) {
            return PokemonDetails(bloc.pokemon!);
          } else {
            return Refetch(bloc.getPokemon);
          }
        },
      ),
    );
  }
}
