import 'package:flutter/material.dart';

import '../../service/pokemon_service.dart';
import '../../state/pokemon_state.dart';

class PokemonStore extends ChangeNotifier {
  final service = PokemonService();

  PokemonState state = EmptyPokemonState();

  getPokemons() async {
    state = LoadingPokemonState();
    notifyListeners();

    try {
      final pokemons = await service.fetchAll();

      state = GettedPokemonState(pokemons: pokemons);
      notifyListeners();
    } catch (e) {
      state = ErrorPokemonState(message: e.toString());
      notifyListeners();
    }
  }
}
