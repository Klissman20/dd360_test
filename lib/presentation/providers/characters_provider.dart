import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/presentation/providers/character_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  final fetchCharacters =
      ref.watch(characterRepositoryProvider).getCharacters();
  return CharactersNotifier();
});

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  bool isLoading = false;

  CharactersNotifier() : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    //final List<CharacterEntity> characters = await fetchMoreMovies(page: currentPage);
    //state = [...state, ...characters];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
