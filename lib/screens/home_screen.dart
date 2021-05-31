import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemons/bloc/home_screen_bloc.dart';
import 'package:flutter_pokemons/widgets/loading.dart';
import 'package:flutter_pokemons/widgets/pokemon_card.dart';
import 'package:flutter_pokemons/widgets/refetch.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeScreenBloc bloc = HomeScreenBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: bloc.output,
          builder: (context, snapshot) {
            if (bloc.isLoading && bloc.pokemons.length == 0) {
              return Loading();
            } else if (bloc.pokemons.length > 0) {
              return GridView.builder(
                controller: bloc.scrollController,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10),
                itemCount: bloc.pokemons.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => bloc.goToPokemon(context, bloc.pokemons[index].name ?? ''),
                    child: PokemonCard(
                      bloc.pokemons[index],
                    ),
                  );
                },
              );
            } else {
              return Refetch(bloc.getPokemons);
            }
          },
        ),
      ),
    );
  }
}
