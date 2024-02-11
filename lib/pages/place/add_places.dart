// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/study_center.dart';
import 'package:study_center_dashboard/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddPlaces extends StatelessWidget {
  AddPlaces({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  bool added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Add Place',
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
                  added = true;
                  StudyCenter center = StudyCenter(
                      name: name.text, study_center_location: location.text);
                  await Supabase.instance.client
                      .from('study_center')
                      .insert(center.toMap());

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ));
                  added = false;
                },
                child: !added
                    ? const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
                      ),
              ),
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
