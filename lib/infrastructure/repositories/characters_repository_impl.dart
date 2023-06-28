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
}
