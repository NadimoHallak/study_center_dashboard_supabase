// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/study_center.dart';
import 'package:study_center_dashboard/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditPlace extends StatelessWidget {
  EditPlace({super.key, required this.center});
  TextEditingController name = TextEditingController();
  StudyCenter center;
  TextEditingController location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = center.name;
    location.text = center.study_center_location;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Edit Place',
            style: TextStyle(
                fontSize: 40, color: blue, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Place Name'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              controller: location,
              decoration: const InputDecoration(hintText: 'Location'),
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
                    print('11111');

                    await Supabase.instance.client.from('study_center').update(
                      {
                        'name': name.text,
                        'study_center_location': location.text
                      },
                    ).eq('id', center.id);

                    print('22222');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
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
                        builder: (context) => MyHomePage(),
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
