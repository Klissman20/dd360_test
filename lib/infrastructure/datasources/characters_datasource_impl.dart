import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

import 'package:dd360_test/infrastructure/mappers/character_mapper.dart';
import 'package:dd360_test/infrastructure/models/character_api_response.dart';
import 'package:dd360_test/config/constants/environmet.dart';
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

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = generateMd5Hash(timestamp, privateKey, publicKey);
    final response = await dio.get('', queryParameters: {
      'apikey': publicKey,
      'hash': hash,
      'ts': timestamp.toString()
    });

    final apiResponse = CharacterApiResponse.fromJson(response.data);

    final List<CharacterEntity> characters = apiResponse.results
        .map((character) => CharacterMapper.characterDbToEntity(character))
        .toList();

    return characters;
  }
}
