import '../models/pokemon.dart';

sealed class PokemonState {}

final class EmptyPokemonState extends PokemonState {}

final class LoadingPokemonState extends PokemonState {}

final class ErrorPokemonState extends PokemonState {
  final String message;

  ErrorPokemonState({required this.message});
}

final class GettedPokemonState extends PokemonState {
  final List<Pokemon> pokemons;

  GettedPokemonState({required this.pokemons});
}
