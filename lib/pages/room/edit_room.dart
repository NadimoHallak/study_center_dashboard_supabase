// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/room_model.dart';
import 'package:study_center_dashboard/model/study_center.dart';
import 'package:study_center_dashboard/pages/home_page.dart';
import 'package:study_center_dashboard/pages/room/add_room.dart';
import 'package:study_center_dashboard/pages/room/display_room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditRoom extends StatelessWidget {
  EditRoom({super.key, required this.room});
  TextEditingController tableCount = TextEditingController();
  Room room;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = room.discreption;
    tableCount.text = room.tables_count.toString();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Edit Room',
            style: TextStyle(
                fontSize: 40, color: blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          StatefulBuilder(builder: (context, setState) {
            return DropdownMenu(
              initialSelection: room.discreption,
              onSelected: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries: List.generate(
                types.length,
                (index) => DropdownMenuEntry(
                  value: types[index],
                  label: types[index],
                ),
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: tableCount,
              decoration: const InputDecoration(hintText: 'Table Count'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  color: blue,
                  onPressed: () async {
                    Room roomCopy = Room(
                      discreption: dropdownValue,
                      tables_count: num.parse(tableCount.text),
                      is_compleate: false,
                      study_center_id: room.study_center_id,
                    );
                    await Supabase.instance.client
                        .from('study_room')
                        .update(roomCopy.toMap())
                        .eq('id', room.id.toString());

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayRooms(
                            id: room.study_center_id,
                          ),
                        ));
                  },
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                width: 20,
              ),
              MaterialButton(
                color: red,
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayRooms(
                          id: room.study_center_id,
                        ),
                      ));
                },
                child: const Text(
                  "Cansel",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
