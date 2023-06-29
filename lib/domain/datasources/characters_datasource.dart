import 'package:dd360_test/domain/entities/character_entity.dart';

abstract class CharactersDatasource {
  Future<List<CharacterEntity>> getCharacters();
  Future<List<CharacterEntity>> getCharactersComicsById(int id);
  Future<List<CharacterEntity>> getCharactersEventsById(int id);
  Future<List<CharacterEntity>> getCharactersSeriesById(int id);
  Future<List<CharacterEntity>> getCharactersStoriesById(int id);
}
