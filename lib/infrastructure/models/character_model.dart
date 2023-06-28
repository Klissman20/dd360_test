class CharacterModel {
  final int id;
  final String name;
  final String description;
  final List<String> comics;
  final List<String> series;
  final List<String> stories;
  final List<String> events;
  final List<String> urls;

  CharacterModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.comics,
      required this.series,
      required this.stories,
      required this.events,
      required this.urls});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      comics: List.from(
          json['comics']['items'].map((item) => item['name'].toString())),
      series: List.from(
          json['series']['items'].map((item) => item['name'].toString())),
      stories: List.from(
          json['stories']['items'].map((item) => item['name'].toString())),
      events: List.from(
          json['events']['items'].map((item) => item['name'].toString())),
      urls: List.from(json['urls'].map((item) => item['url'].toString())));

  Map<String, dynamic> toJson() => {
        "adult": id,
        "name": name,
        "description": description,
        "comics": comics,
        "series": series,
        "stories": stories,
        "events": events,
        "urls": urls
      };
}
