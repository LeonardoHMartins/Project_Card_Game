// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CardModel {
  final int id;
  final String name;
  CardModel({
    required this.id,
    required this.name,
  });

  CardModel copyWith({
    int? id,
    String? name,
  }) {
    return CardModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) => CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CardModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
