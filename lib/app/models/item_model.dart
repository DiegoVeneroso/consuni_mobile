import 'dart:convert';

class ItemModel {
  final int? id;
  final String title;
  final String subtitle;
  final String descripion;
  ItemModel({
    this.id,
    required this.title,
    required this.subtitle,
    required this.descripion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'descripion': descripion,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      descripion: map['descripion'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
