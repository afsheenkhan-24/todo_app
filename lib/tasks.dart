import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';
import 'package:todo/database/supabase_handler.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final SupabaseHandler supabaseHandler = SupabaseHandler();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const Home();
        },
        focusColor: Colors.deepPurpleAccent,
        autofocus: true,
        elevation: 15,
        child: const Icon(Icons.add, size: 35),
      ),
      appBar: AppBar(
        title: const Text('Supabase Data List'),
      ),
      body: Center(
        child: FutureBuilder(
          future: supabaseHandler.readData(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              final tasks = snapshot.data!;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(tasks[index]['title']),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}


