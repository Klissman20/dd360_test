import 'package:dd360_test/domain/datasources/characters_datasource.dart';
import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/domain/repositories/characters_repository.dart';

class CharacterRepositoryImpl extends CharactersRepository {
  final CharactersDatasource dataSource;

  CharacterRepositoryImpl(this.dataSource);

  @override
  Future<List<CharacterEntity>> getCharacters() {
    return dataSource.getCharacters();
  }

  @override
  Future<List<CharacterEntity>> getCharactersComicsById(int id) {
    return dataSource.getCharactersComicsById(id);
  }

  @override
  Future<List<CharacterEntity>> getCharactersEventsById(int id) {
    return dataSource.getCharactersEventsById(id);
  }

  @override
  Future<List<CharacterEntity>> getCharactersSeriesById(int id) {
    return dataSource.getCharactersSeriesById(id);
  }

  @override
  Future<List<CharacterEntity>> getCharactersStoriesById(int id) {
    return dataSource.getCharactersStoriesById(id);
  }
}
