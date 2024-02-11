import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/room_list_model.dart';
import 'package:study_center_dashboard/model/room_model.dart';
import 'package:study_center_dashboard/model/study_center.dart';
import 'package:study_center_dashboard/pages/room/add_room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DisplayRooms extends StatelessWidget {
  DisplayRooms({super.key, this.id});
  num? id;
  @override
  Widget build(BuildContext context) {
    var studyRoom = Supabase.instance.client
        .from('study_room')
        .stream(primaryKey: ['id']).eq('study_center_id', '$id');
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: StreamBuilder(
            stream: studyRoom,
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              RoomList room = RoomList.fromMap(snapshot.data!);
              return DataTable(
                border: TableBorder.lerp(
                    const TableBorder(), const TableBorder(), 2),
                columns: [
                  DataColumn(
                    label: Text(
                      "Discreption",
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Table Count",
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Delete",
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Edit",
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ],
                rows: [
                  ...List.generate(
                    room.rooms.length,
                    (index) => DataRow(
                      onLongPress: () {},
                      cells: [
                        DataCell(
                          Text(room.rooms[index].discreption),
                        ),
                        DataCell(
                          Text(
                            room.rooms[index].tables_count.toString(),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            onPressed: () async {
                              await Supabase.instance.client
                                  .from('study_room')
                                  .delete()
                                  .eq('id', room.rooms[index].id!);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: red,
                            ),
                          ),
                        ),
                        DataCell(
                          IconButton(
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => EditPlace(
                              //         center: places.studyCenters[index],
                              //       ),
                              //     ));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataRow(
                    onLongPress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddRoom(id: room.rooms[0].study_center_id),
                          ));
                    },
                    cells: const [
                      DataCell(
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black45,
                        ),
                      ),
                      DataCell(
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black45,
                        ),
                      ),
                      DataCell(
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black45,
                        ),
                      ),
                      DataCell(
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
