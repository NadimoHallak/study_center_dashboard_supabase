import 'package:flutter/material.dart';
import 'package:study_center_dashboard/main.dart';
import 'package:study_center_dashboard/model/study_center_list.dart';
import 'package:study_center_dashboard/pages/add_places.dart';
import 'package:study_center_dashboard/pages/edit_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: StreamBuilder(
            stream: studyRoomPlace,
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              // print(snapshot.data);
              StudyCenterList places = StudyCenterList.fromMap(snapshot.data!);
              // print(places);
              return DataTable(
                border: TableBorder.lerp(
                    const TableBorder(), const TableBorder(), 2),
                columns: [
                  DataColumn(
                    label: Text(
                      "Name",
                      style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Location",
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
                    places.studyCenters.length,
                    (index) => DataRow(
                      onLongPress: () {},
                      cells: [
                        DataCell(
                          Text(places.studyCenters[index].name),
                        ),
                        DataCell(
                          Text(
                              places.studyCenters[index].study_center_location),
                        ),
                        DataCell(
                          IconButton(
                            onPressed: () async {
                              await Supabase.instance.client
                                  .from('study_center')
                                  .delete()
                                  .eq('id', places.studyCenters[index].id);
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPlace(
                                      center: places.studyCenters[index],
                                    ),
                                  ));
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
                            builder: (context) => AddPlaces(),
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
