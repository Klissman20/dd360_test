import 'package:dd360_test/domain/entities/character_entity.dart';
import 'package:dd360_test/infrastructure/models/character_model.dart';

class CharacterMapper {
  static CharacterEntity characterDbToEntity(CharacterModel character) =>
      CharacterEntity(
          id: character.id,
          name: character.name,
          description: character.description);
}
