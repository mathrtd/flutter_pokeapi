import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemons/models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: kElevationToShadow[1],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              bottom: -39,
              left: -26,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  width: 100,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.network(pokemon.defaultSpriteUrlFromId()),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Text(
                pokemon.name.toString().toUpperCase(),
                style: TextStyle(
                  shadows: kElevationToShadow[1],
                  fontSize: 16,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
