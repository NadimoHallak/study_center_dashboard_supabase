// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/room_model.dart';
import 'package:study_center_dashboard/model/study_center.dart';
import 'package:study_center_dashboard/pages/home_page.dart';
import 'package:study_center_dashboard/pages/room/display_room.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddRoom extends StatelessWidget {
  AddRoom({super.key, required this.id});
  TextEditingController discreption = TextEditingController();
  TextEditingController tableCount = TextEditingController();

  final num id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add Room',
            style: TextStyle(
                fontSize: 40, color: blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: discreption,
              decoration: const InputDecoration(hintText: 'Discreption'),
            ),
          ),
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
                    Room room = Room(
                      discreption: discreption.text,
                      tables_count: num.parse(tableCount.text),
                      is_compleate: false,
                      study_center_id: id,
                    );
                    await Supabase.instance.client
                        .from('study_room')
                        .insert(room.toMap());

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DisplayRooms(
                            id: id,
                          ),
                        ));
                  },
                  child: const Text(
                    "Add",
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
                          id: id,
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
