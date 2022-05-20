import 'dart:convert';

class ItemModel {
  int id;
  String title;
  String Subtitle;
  String image;
  ItemModel({
    required this.id,
    required this.title,
    required this.Subtitle,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'Subtitle': Subtitle,
      'image': image,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      Subtitle: map['Subtitle'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
