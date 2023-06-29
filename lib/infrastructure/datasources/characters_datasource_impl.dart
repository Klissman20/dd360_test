import 'dart:convert';
import 'package:dd360_test/config/constants/environment.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

import 'package:dd360_test/infrastructure/mappers/character_mapper.dart';
import 'package:dd360_test/infrastructure/models/character_api_response.dart';
import 'package:dd360_test/domain/datasources/characters_datasource.dart';
import 'package:dd360_test/domain/entities/character_entity.dart';

class CharactersDatasourceImpl extends CharactersDatasource {
  final publicKey = Environment.publicKey;
  final privateKey = Environment.privateKey;

  final dio = Dio(BaseOptions(
      baseUrl: 'https://gateway.marvel.com:443/v1/public/characters'));

  String generateMd5Hash(int timeStamp, String privateKey, String publicKey) {
    return md5
        .convert(utf8.encode('${timeStamp.toString()}$privateKey$publicKey'))
        .toString();
  }

  List<CharacterEntity> _jsonToCharacter(Map<String, dynamic> json) {
    final apiResponse = CharacterApiResponse.fromJson(json);

    final List<CharacterEntity> characters = apiResponse.results
        .map((character) => CharacterMapper.characterDbToEntity(character))
        .toList();

    return characters;
  }

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('', queryParameters: {
      'limit': 40,
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<CharacterEntity>> getCharactersComicsById(int id) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('/$id/comics', queryParameters: {
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<CharacterEntity>> getCharactersEventsById(int id) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('/$id/events', queryParameters: {
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<CharacterEntity>> getCharactersSeriesById(int id) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('/$id/series', queryParameters: {
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    return _jsonToCharacter(response.data);
  }

  @override
  Future<List<CharacterEntity>> getCharactersStoriesById(int id) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('/$id/stories', queryParameters: {
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    return _jsonToCharacter(response.data);
  }
}
