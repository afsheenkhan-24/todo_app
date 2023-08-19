import 'package:flutter/material.dart';
import 'package:todo/login.dart';

void main() {
  runApp(const ToDo());
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
