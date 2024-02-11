// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:study_center_dashboard/model/study_center.dart';

class StudyCenterList {
  List<StudyCenter> studyCenters;
  StudyCenterList({
    required this.studyCenters,
  });

  StudyCenterList copyWith({
    List<StudyCenter>? studyCenters,
  }) {
    return StudyCenterList(
      studyCenters: studyCenters ?? this.studyCenters,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studyCenters': studyCenters.map((x) => x.toMap()).toList(),
    };
  }

  factory StudyCenterList.fromMap(List<Map<String, dynamic>> centers) {
    return StudyCenterList(
        studyCenters: List.generate(
            centers.length, (index) => StudyCenter.fromMap(centers[index])));
  }

  @override
  String toString() => 'StudyCenterList(studyCenters: $studyCenters)';

  @override
  bool operator ==(covariant StudyCenterList other) {
    if (identical(this, other)) return true;

    return listEquals(other.studyCenters, studyCenters);
  }

  @override
  int get hashCode => studyCenters.hashCode;
}
