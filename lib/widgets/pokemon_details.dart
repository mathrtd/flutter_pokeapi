import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemons/configs/colors.dart';
import 'package:flutter_pokemons/models/pokemon.dart';
import 'package:flutter_pokemons/widgets/attribute_name_value.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    child: Image.network(
                      pokemon.defaultSpriteUrl ?? 'https://static.wikia.nocookie.net/pokemonet/images/1/19/Missingno..png/revision/latest?cb=20130505210537&path-prefix=pt-br',
                      fit: BoxFit.cover,
                    ),
                  ),
                  ...pokemon.types!.map(
                    (e) {
                      return Container(
                        width: 100,
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.typeColors[e.type!.name],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: kElevationToShadow[1],
                        ),
                        child: Text(
                          e.type?.name?.toUpperCase() ?? 'N/A',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...pokemon.stats!.map(
                    (e) {
                      return AttributeNameValue(
                        "${e.stat?.name?.toUpperCase() ?? 'N/A'}:",
                        e.baseStat.toString(),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AttributeNameValue(
                    "ALTURA:",
                    "${pokemon.heightInMeters()} m",
                  ),
                  AttributeNameValue(
                    "PESO:",
                    "${pokemon.weightInKilograms()} kg",
                  ),
                ],
              )

              // Text("Altura: ${pokemon.heightInMeters()} m"),
              // Text("Peso: ${pokemon.weightInKilograms()} kg"),
            ],
          ),
        ],
      ),
    );
  }
}
