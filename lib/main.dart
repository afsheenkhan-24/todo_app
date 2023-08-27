import 'package:flutter/material.dart';
import 'package:todo/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://okwlftfvyvucodaefdwu.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9rd2xmdGZ2eXZ1Y29kYWVmZHd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NTczMjYsImV4cCI6MjAwODAzMzMyNn0.o0OzoS_B4r79pYxfot8ddimHFPZQrvjIrtpWkOpQo5c');
  runApp(const ToDo());

  final supabase = Supabase.instance.client;
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent,
        canvasColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SafeArea(
        child: Scaffold(
          body: Login(),
        ),
      ),
    );
  }
}
