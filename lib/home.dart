import 'package:flutter/material.dart';
import 'package:todo/add_task.dart';
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
  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurpleAccent,
          canvasColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        home: const AddTask()
        // FutureBuilder(
        //   builder : (
        //     BuildContext context,
        //     AsyncSnapshot<String> snapshot,
        //   ) {
        //     if (!snapshot.hasData &&
        //         snapshot.connectionState == ConnectionState.none) {}

        //     return ListView.builder(
        //         itemBuilder: (context, index) {
        //           return Container(
        //             height: 200,
        //             color: ((snapshot.data[index]['status'])
        //                 ? Colors.white
        //                 : Colors.yellowAccent),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Container(
        //                   child: Text(snapshot.data[index]['title']),
        //                 )
        //               ],
        //             ),
        //           );
        //         });
        //   },
        //   future: SupabaseHandler.readData(),
        // )
        );
  }
}
