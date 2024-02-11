// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:study_center_dashboard/model/room_model.dart';

class RoomList {
  List<Room> rooms;
  RoomList({
    required this.rooms,
  });

  RoomList copyWith({
    List<Room>? rooms,
  }) {
    return RoomList(
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rooms': rooms.map((x) => x.toMap()).toList(),
    };
  }

  factory RoomList.fromMap(List<Map<String, dynamic>> list) {
    return RoomList(
        rooms:
            List.generate(list.length, (index) => Room.fromMap(list[index])));
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() => 'RoomList(rooms: $rooms)';

  @override
  bool operator ==(covariant RoomList other) {
    if (identical(this, other)) return true;

    return listEquals(other.rooms, rooms);
  }

  @override
  int get hashCode => rooms.hashCode;
}
