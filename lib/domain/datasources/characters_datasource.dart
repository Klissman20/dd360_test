import 'package:dd360_test/domain/entities/character_entity.dart';

abstract class CharactersDatasource {
  Future<List<CharacterEntity>> getCharacters();
}
