// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudyCenter {
  num? id;
  String name;
  String study_center_location;
  StudyCenter({
    this.id,
    required this.name,
    required this.study_center_location,
  });

  StudyCenter copyWith({
    num? id,
    String? name,
    String? study_center_location,
  }) {
    return StudyCenter(
      id: id ?? this.id,
      name: name ?? this.name,
      study_center_location:
          study_center_location ?? this.study_center_location,
    );
  }

  Map<String, dynamic> toMap() {
    return id == null
        ? <String, dynamic>{
            'name': name,
            'study_center_location': study_center_location,
          }
        : <String, dynamic>{
            'id': id,
            'name': name,
            'study_center_location': study_center_location,
          };
  }

  factory StudyCenter.fromMap(Map<String, dynamic> map) {
    return StudyCenter(
      id: map['id'] as num,
      name: map['name'] as String,
      study_center_location: map['study_center_location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudyCenter.fromJson(String source) =>
      StudyCenter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudyCenter(id: $id, name: $name, study_center_location: $study_center_location)';

  @override
  bool operator ==(covariant StudyCenter other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.study_center_location == study_center_location;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ study_center_location.hashCode;
}
