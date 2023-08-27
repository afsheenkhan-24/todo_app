import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

class SupabaseHandler {
  static String supabaseURL = 'https://okwlftfvyvucodaefdwu.supabase.co';
  static String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9rd2xmdGZ2eXZ1Y29kYWVmZHd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NTczMjYsImV4cCI6MjAwODAzMzMyNn0.o0OzoS_B4r79pYxfot8ddimHFPZQrvjIrtpWkOpQo5c';

  final client = SupabaseClient(supabaseURL, supabaseKey);

  

  addData(String titleValue, String descrValue, String statusValue) {
    var response = client
    .from('tasks').insert({'title': titleValue, 'descr': descrValue, 'status': statusValue})
    .then((value) => value);
    print(response);
  }

  readData() async {
    var response = await client
    .from('tasks')
    .select()
    .order('title', ascending: true)
    .then((value) => value);
    print(response);

    final dataList = response.data as List;
    return dataList;
  }

  updateData(int id, bool statusValue) {
    var response = client
    .from('tasks')
    .update({'status': statusValue})
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