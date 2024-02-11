import 'package:flutter/material.dart';
import 'package:study_center_dashboard/model/study_center_list.dart';
import 'package:study_center_dashboard/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mqoxadgidekngwbjwtfa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1xb3hhZGdpZGVrbmd3Ymp3dGZhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY3OTQ4MTYsImV4cCI6MjAyMjM3MDgxNn0.Rhm_ecx9QXQSH4twWyrqYyYVX478Zzuh8x6Ls448sdU',
  );

  runApp(MyApp());
}

Color blue = const Color.fromARGB(255, 21, 63, 117);
Color red = const Color.fromARGB(255, 245, 30, 30);

var studyRoomPlace =
    Supabase.instance.client.from('study_center').stream(primaryKey: ['id']);

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
