class CharacterModel {
  final int id;
  final String name;
  final String description;
  final String? imageUrl;
  final List<String> urls;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.urls,
      required this.imageUrl});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
      id: json['id'],
      name: json['name'] ?? json['title'],
      description: json['description'] ?? 'No Description',
      imageUrl: (json['thumbnail'] != null)
          ? json['thumbnail']['path']
          : 'http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available',
      urls: (json['urls'] != null)
          ? List.from(json['urls'].map((item) => item['url']))
          : []);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "urls": urls
      };
}
