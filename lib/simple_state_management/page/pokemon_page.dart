import 'package:flutter/material.dart';

import '../../models/pokemon.dart';
import '../../state/pokemon_state.dart';
import '../state_management/pokemon_store.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  PokemonStore store = PokemonStore();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: store,
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Pokemons'),
            ),
            body: switch (store.state) {
              LoadingPokemonState() => const LoadingProgress(),
              ErrorPokemonState(message: final message) => ErrorStateButton(
                  store: store,
                  message: message,
                ),
              EmptyPokemonState() => EmptyStateButton(store: store),
              GettedPokemonState(pokemons: final pokemons) =>
                PokemonList(pokemons: pokemons)
            },
          );
        });
  }
}

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorStateButton extends StatelessWidget {
  const ErrorStateButton({
    super.key,
    required this.store,
    required this.message,
  });

  final PokemonStore store;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: store.getPokemons, child: Text(message)),
    );
  }
}

class EmptyStateButton extends StatelessWidget {
  const EmptyStateButton({
    super.key,
    required this.store,
  });

  final PokemonStore store;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: store.getPokemons,
        child: const Text('Toque aqui'),
      ),
    );
  }
}

class PokemonList extends StatelessWidget {
  const PokemonList({super.key, required this.pokemons});

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons[index];

        return ListTile(
          title: Text(pokemon.name),
        );
      },
    );
  }
}
