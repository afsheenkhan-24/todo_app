// import 'package:supabase/supabase.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:todo/supabase_handler.dart';

// class AuthService {
//   Future<String?> signUp({
//     required String email,
//     required String password,
//   }) async {
//     GotrueSessionResponse response =
//         await SupabaseHandler.client.auth.SignUp(email, password);

//     if (response.error == null) {
//       String? userEmail = response.data!.user!.email;
//       print('Signup successful! : $userEmail');
//     } else {
//       print('Signup error : ${response.error!.message}');
//     }
//   }

//   Future<String?> login({
//     required String email,
//     required String password,
//   }) async {
//     GotrueSessionResponse response = await SupabaseHandler.client.auth.Login(
//         email: email,
//         password: password,
//         options: AUthOptions(redirectTo: SupabaseHandler.supabaseURL));

//     if (response.error == null) {
//       String? userEmail = response.data!.user!.email;
//       print('Login successful! : $userEmail');
//     } else {
//       print('Login error : ${response.error!.message}');
//     }
//   }

// }
