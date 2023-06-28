import 'package:dd360_test/infrastructure/models/character_model.dart';

class CharacterApiResponse {
  final List<CharacterModel> results;
  final String copyright;
  final String attributionText;
  final String attributionHTML;
  final String etag;

  CharacterApiResponse(
      {required this.copyright,
      required this.results,
      required this.attributionText,
      required this.attributionHTML,
      required this.etag});

  factory CharacterApiResponse.fromJson(Map<String, dynamic> json) =>
      CharacterApiResponse(
          copyright: json['copyright'],
          results: List<CharacterModel>.from(
              json["data"]['results'].map((x) => CharacterModel.fromJson(x))),
          attributionText: json['copyright'],
          attributionHTML: json['copyright'],
          etag: json['copyright']);
}
