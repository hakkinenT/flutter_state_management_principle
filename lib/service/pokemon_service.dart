import '../models/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> fetchAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return const [
      Pokemon(
          name: "Pikachu",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png"),
      Pokemon(
          name: "Bulbasaur",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
      Pokemon(
          name: "Charmander",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png"),
      Pokemon(
          name: "Charizard",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/006.png"),
      Pokemon(
          name: "Clefairy",
          imageUrl:
              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/035.png"),
    ];
  }
}
