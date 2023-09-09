import 'package:supabase/supabase.dart';

class SupabaseHandler {
  
  static String supabaseURL = 'https://okwlftfvyvucodaefdwu.supabase.co';
  static String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9rd2xmdGZ2eXZ1Y29kYWVmZHd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NTczMjYsImV4cCI6MjAwODAzMzMyNn0.o0OzoS_B4r79pYxfot8ddimHFPZQrvjIrtpWkOpQo5c';

    static SupabaseClient client = SupabaseClient(supabaseURL, supabaseKey);


  addData(String titleValue, String descrValue, String statusValue) {
    var response = client
    .from('tasks').insert({'title': titleValue, 'descr': descrValue, 'status': statusValue})
    .then((value) => value);
    print(response);
  }

  Future<dynamic> readData() async {
    final response =  client.from('tasks').select()
    .then((value) {
      print(value);
      return value;
    }
    );
    var dataList = response;
    return dataList;
  }

  updateData(int id, String descrValue, String statusValue) {
    var response = client
    .from('tasks')
    .update({'status': statusValue, 'descr': descrValue})
    .eq('id', id)
    .then((value) => value);

    print(response);
  }

  deleteData(int id) {
    var response = client
    .from('tasks')
    .delete()
    .eq('id', id)
    .then((value) => value);

    print(response);
  }
}

// class TaskList extends StatelessWidget {
//   TaskList({super.key});

//   SupabaseHandler supahand = SupabaseHandler();

//   // List<String> tasks = readData();

//   @override
//   Widget build(context) {
//         return SafeArea(
//         child: Scaffold(
//           body: FutureBuilder(
//             future: supahand.readData(),
//             builder: (
//               BuildContext index,
//               AsyncSnapshot snapshot,
//             ) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               }
//               else if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return const Text('error');
//                 } else if (snapshot.hasData) {
//                   return ListView.builder(itemBuilder: (context, index) {
//                     return Card(
//                       child: Text(snapshot.data[index].title),
//                     );
//                   });
//                 } else {
//                   return const Text('no data');
//                 }
//               } else {
//                 return Text('Connection State: ${snapshot.connectionState}');
//               }
//             },
//           ),
//         ),
//       );
//   }
// }