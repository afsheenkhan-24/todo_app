import 'package:flutter/material.dart';
import 'package:todo/supabase_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  SupabaseHandler supabaseHandler = SupabaseHandler();

  @override
  void initState() {
    super.initState();
  }

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
      //     body: FutureBuilder(
      //   future: readData(),
      //   builder: (context, AsyncSnapshot<dynamic> snapshot) {
      //     if (snapshot.hasData) {
      //       final tasks = snapshot.data!;
      //       return ListView.builder(
      //         itemCount: tasks.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return Card(
      //             child: Text(tasks[index]['title']),
      //           );
      //         },
      //       );
      //     } 
      //     else {
      //       return Container();
      //     }
      //   },
      // ),),
        ),
      ));
  }
}
