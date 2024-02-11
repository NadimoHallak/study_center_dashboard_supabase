// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Room {
  num? id;
  String discreption;
  num tables_count;
  bool is_compleate;
  num study_center_id;
  Room({
    this.id,
    required this.discreption,
    required this.tables_count,
    required this.is_compleate,
    required this.study_center_id,
  });

  Room copyWith({
    num? id,
    String? discreption,
    num? tables_count,
    bool? is_compleate,
    num? study_center_id,
  }) {
    return Room(
      id: id ?? this.id,
      discreption: discreption ?? this.discreption,
      tables_count: tables_count ?? this.tables_count,
      is_compleate: is_compleate ?? this.is_compleate,
      study_center_id: study_center_id ?? this.study_center_id,
    );
  }

  Map<String, dynamic> toMap() {
    return id == null
        ? <String, dynamic>{
            'discreption': discreption,
            'tables_count': tables_count,
            'is_compleate': is_compleate,
            'study_center_id': study_center_id,
          }
        : <String, dynamic>{
            'id': id,
            'discreption': discreption,
            'tables_count': tables_count,
            'is_compleate': is_compleate,
            'study_center_id': study_center_id,
          };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] != null ? map['id'] as num : null,
      discreption: map['discreption'] as String,
      tables_count: map['tables_count'] as num,
      is_compleate: map['is_compleate'] as bool,
      study_center_id: map['study_center_id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) =>
      Room.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Room(id: $id, discreption: $discreption, tables_count: $tables_count, is_compleate: $is_compleate, study_center_id: $study_center_id)';
  }

  @override
  bool operator ==(covariant Room other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.discreption == discreption &&
        other.tables_count == tables_count &&
        other.is_compleate == is_compleate &&
        other.study_center_id == study_center_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        discreption.hashCode ^
        tables_count.hashCode ^
        is_compleate.hashCode ^
        study_center_id.hashCode;
  }
}
