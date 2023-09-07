import 'package:flutter/material.dart';
import 'package:todo/modal_task.dart';
import 'package:todo/supabase_handler.dart';

class EditTask extends StatefulWidget {
  ModalTask modalTask = const ModalTask();

  EditTask(
      {super.key,
      required this.title,
      required this.descr,
      required this.id,
      required this.status});

  final String title;
  final String descr;
  final int id;
  final String status;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
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
    'Completed',
  ];

  String selectedVal = 'Started';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          margin: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    titleController.text = value;
                  });
                },
                controller: titleController..text = widget.title,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Title',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
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
                controller: descrController..text = widget.descr,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(width: 1, color: Colors.redAccent),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Description',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
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
                        borderRadius: BorderRadius.circular(18)),
                    minimumSize: const Size.fromHeight(65),
                    textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                onPressed: () {
                  supabaseHandler.updateData(
                      widget.id, descrController.text, selectedVal);
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Update"),
                      content: const Text("Task updated successfully!"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            color: Colors.deepPurple,
                            padding: const EdgeInsets.all(14),
                            child: const Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Edit Task'),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: Column(
        //     children: [
        //       Text(widget.title),
        //       Text(widget.descr),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
