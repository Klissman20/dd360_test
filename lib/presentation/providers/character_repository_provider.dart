import 'package:dd360_test/infrastructure/datasources/characters_datasource_impl.dart';
import 'package:dd360_test/infrastructure/repositories/characters_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//immutable repository
final characterRepositoryProvider = Provider((ref) {
  return CharacterRepositoryImpl(CharactersDatasourceImpl());
});
