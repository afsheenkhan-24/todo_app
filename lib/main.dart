import 'package:flutter/material.dart';
import 'package:todo/login/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://okwlftfvyvucodaefdwu.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9rd2xmdGZ2eXZ1Y29kYWVmZHd1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NTczMjYsImV4cCI6MjAwODAzMzMyNn0.o0OzoS_B4r79pYxfot8ddimHFPZQrvjIrtpWkOpQo5c');
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
        primaryColor: Colors.deepPurple,
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

// class SplashScreenPage extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return SplashScreen(  
//       seconds: 5,  
//       navigateAfterSeconds: new HomeScreen(),  
//       backgroundColor: Colors.yellow,  
//       title: new Text('Flutter Javatpoint',textScaleFactor: 2,),  
//       image: new Image.network(  
//           'https://static.javatpoint.com/tutorial/flutter/images/flutter-creating-android-platform-specific-code3.png'  
//       ),  
//       loadingText: Text("Loading"),  
//       photoSize: 150.0,  
//       loaderColor: Colors.red,  
//     );  
//   }  
// }  




// FutureBuilder(
//             future: supabaseHandler.readData(),
//             builder: (
//               BuildContext ctx,
//               AsyncSnapshot snapshot,
//             ) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const CircularProgressIndicator();
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 if (snapshot.hasError) {
//                   return const Text('Error');
//                 } else if (snapshot.hasData) {
//                   return Text(snapshot.data,
//                       style: const TextStyle(color: Colors.black, fontSize: 30));
//                 } else {
//                   return const Text('no data');
//                 }
//               } else {
//                 return Text('Connection State: ${snapshot.connectionState}');
//               }
//             },
//           ),