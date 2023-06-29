import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/presentation/providers/character_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterComicsProvider =
    StateNotifierProvider<CharacterDataNotifier, List<CharacterEntity>>((ref) {
  final dataRepository =
      ref.watch(characterRepositoryProvider).getCharactersComicsById;
  return CharacterDataNotifier(fetchData: dataRepository);
});

final characterSeriesProvider =
    StateNotifierProvider<CharacterDataNotifier, List<CharacterEntity>>((ref) {
  final fetchData =
      ref.watch(characterRepositoryProvider).getCharactersSeriesById;
  return CharacterDataNotifier(fetchData: fetchData);
});

final characterEventsProvider =
    StateNotifierProvider<CharacterDataNotifier, List<CharacterEntity>>((ref) {
  final fetchData =
      ref.watch(characterRepositoryProvider).getCharactersEventsById;
  return CharacterDataNotifier(fetchData: fetchData);
});

final characterStoriesProvider =
    StateNotifierProvider<CharacterDataNotifier, List<CharacterEntity>>((ref) {
  final fetchData =
      ref.watch(characterRepositoryProvider).getCharactersStoriesById;
  return CharacterDataNotifier(fetchData: fetchData);
});

typedef GetDataCallback = Future<List<CharacterEntity>> Function(int id);

class CharacterDataNotifier extends StateNotifier<List<CharacterEntity>> {
  int currentPage = 0;
  bool isLoading = false;
  GetDataCallback fetchData;

  CharacterDataNotifier({required this.fetchData}) : super([]);

  Future<void> loadData(int id) async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<CharacterEntity> characterData = await fetchData(id);
    state = [...state, ...characterData];
    await Future.delayed(const Duration(milliseconds: 500));
    isLoading = false;
  }
}
