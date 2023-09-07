import 'package:flutter/material.dart';
import 'package:todo/edit_task.dart';
import 'package:todo/supabase_handler.dart';

class ModalTask extends StatefulWidget {
  const ModalTask({super.key});

  @override
  State<ModalTask> createState() => _ModalTaskState();
}

class _ModalTaskState extends State<ModalTask> {
  SupabaseHandler supabaseHandler = SupabaseHandler();

  final titleController = TextEditingController();
  final descrController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descrController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  var statuses = [
    'Started',
    'Ongoing',
  ];

  String selectedVal = 'Started';

  loadData() {
    return supabaseHandler.readData();
  }

  @override
  Widget build(context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        canvasColor: Colors.grey[100],
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.0))),
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
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
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
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
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
                                      icon: const Icon(
                                          Icons.description_outlined),
                                      color: Colors.grey),
                                ),
                                keyboardType: TextInputType.multiline,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DropdownButton(
                                isExpanded: true,
                                hint: const Text('Status'),
                                value: selectedVal,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: statuses.map((String stat) {
                                  return DropdownMenuItem(
                                    value: stat,
                                    child: Text(stat),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedVal = value!;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.deepPurple,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    minimumSize: const Size.fromHeight(65),
                                    textStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                onPressed: () {
                                  supabaseHandler.addData(titleController.text,
                                      descrController.text, selectedVal);
                                      setState(() { 
                                      });
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
            backgroundColor: Colors.deepPurple,
            autofocus: true,
            elevation: 15,
            child: const Icon(Icons.add, size: 35),
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/profile.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Welcome back, Kelly!!',
                          style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 61, 60, 60),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      // margin: const EdgeInsets.only(top: 10),
                      width: double.infinity,
                      height: 131,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Text(
                                  'Tasks',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Completed 12',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.green[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 4),
                                    child: Text(
                                      'Pending 8',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.yellow[700],
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // CircularProgressIndicator(
                          //   backgroundColor: Colors.white,
                          //   valueColor: AlwaysStoppedAnimation(Colors.yellow),
                          //   strokeWidth: 10,
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green[600],
                                  ),
                                ),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '8',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.yellow[700],
                                  ),
                                ),
                                Text(
                                  'Pending',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.yellow[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4, 4, 4, 4),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange[900],
                                  ),
                                ),
                                Text(
                                  'Started',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.orange[900],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: supabaseHandler.readData(),
                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          final tasks = snapshot.data!;

                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: tasks.length,
                            itemBuilder: (BuildContext context, int index) {
                              // return  (
                              //   children: [
                              //     Card(
                              //       margin: const EdgeInsets.all(20),
                              //       shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(18)),9
                              //     ),
                              //     SizedBox(
                              //       height: 15,
                              //       child: Text(tasks[index]['title']),
                              //     )
                              //   ],
                              // );
                              final taskId = tasks[index]['id'];
                              final taskStatus = tasks[index]['status'];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditTask(
                                            title: tasks[index]['title'],
                                            descr: tasks[index]['descr'],
                                            id: tasks[index]['id'],
                                            status: tasks[index]['status'],
                                          )));
                                },
                                child: Card(
                                  // margin: const EdgeInsets.only(top: 10),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 10, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 5,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: (taskStatus == 'Started') ? Colors.orange : (taskStatus == 'Ongoing') ? Colors.yellow : Colors.green,
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    tasks[index]['title'],
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    tasks[index]['descr'],
                                                    softWrap: true,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 10, 10, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            (taskStatus == 'Started' || taskStatus == 'Ongoing')
                                            ? IconButton(
                                              iconSize: 25,
                                              icon: Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                color: Colors.green[600],
                                                size: 35,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            )
                                            : const SizedBox(
                                              width: 15,
                                            ),
                                            IconButton(
                                              iconSize: 25,
                                              color: Colors.red,
                                              icon: const Icon(
                                                Icons.cancel_outlined,
                                                color: Colors.red,
                                                size: 35,
                                              ),
                                              onPressed: () {
                                                supabaseHandler.deleteData(
                                                    tasks[index]['id']);
                                                setState(() {});
                                                print('deleted ...');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor: AlwaysStoppedAnimation(
                                  Colors.deepPurpleAccent),
                              strokeWidth: 5,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
