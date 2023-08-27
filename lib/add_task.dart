import 'package:flutter/material.dart';
import 'package:todo/supabase_handler.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

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
      home: const SafeArea(
        child: Scaffold(
          body: ModalTask()
        )
      )
    );
  }
}

class ModalTask extends StatefulWidget {
  const ModalTask({super.key});

  @override
  State<ModalTask> createState() => _ModalTaskState();
}

class _ModalTaskState extends State<ModalTask> {

SupabaseHandler supabaseHandler = SupabaseHandler();

  final titleController = TextEditingController();
  final descrController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descrController.dispose();
    statusController.dispose();
    super.dispose();
  }

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
    home: SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(28.0))),
              // backgroundColor: Colors.grey,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      right: 20,
                      left: 20,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Wrap(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  titleController.text = value;
                                });
                              },
                              controller: titleController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.redAccent),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Title',
                                hintStyle: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.title),
                                    color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  descrController.text = value;
                                });
                              },
                              controller: descrController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.redAccent),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Description',
                                hintStyle: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.description_outlined),
                                    color: Colors.grey),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  statusController.text = value;
                                });
                              },
                              controller: statusController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.redAccent),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Status',
                                hintStyle: const TextStyle(
                                    fontSize: 16, color: Colors.grey),
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.update_outlined),
                                    color: Colors.grey),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  minimumSize: const Size.fromHeight(65),
                                  textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              onPressed: () {
                                supabaseHandler.addData(titleController.text, descrController.text, statusController.text);
                              },
                              child: const Text('Add Task'),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          focusColor: Colors.deepPurpleAccent,
          autofocus: true,
          elevation: 15,
          child: const Icon(Icons.add, size: 35),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Image.asset('assets/profile.jpg'),
                      Text(
                        'Welcome back, Kelly!',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 61, 60, 60),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
    );
  }
}