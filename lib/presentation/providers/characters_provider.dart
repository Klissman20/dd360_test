import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/presentation/providers/character_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterListProvider =
    StateNotifierProvider<CharactersNotifier, List<CharacterEntity>>((ref) {
  return CharactersNotifier(ref);
});

class CharactersNotifier extends StateNotifier<List<CharacterEntity>> {
  bool isLoading = false;
  Ref ref;
  CharactersNotifier(this.ref) : super([]);

  Future<void> fetchCharacters() async {
    if (isLoading) return;
    isLoading = true;
    final List<CharacterEntity> characters =
        await ref.watch(characterRepositoryProvider).getCharacters();
    state = [...state, ...characters];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
