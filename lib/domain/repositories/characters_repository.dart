import 'package:dd360_test/domain/entities/character_entity.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getCharacters();
}
