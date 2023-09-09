import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';
import 'package:todo/service/constants.dart';
import 'package:todo/sign_up/sign_up.dart';
import 'package:todo/database/supabase_handler.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formkey = GlobalKey();
  final SupabaseHandler supabaseHandler = SupabaseHandler();

  late TextEditingController _unController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();

    _unController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _unController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _signIn() async {

    final isValid = _formkey.currentState?.validate();

    if (isValid != null && isValid) {
      await supabase.auth.signInWithPassword(
      email: _unController.text,
      password: _pwController.text,
    );
    }
    
  }


  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        canvasColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formkey,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/login.jpg'),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      controller: _unController,
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
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Username',
                        hintStyle:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person_2_outlined),
                            color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      maxLines: 1,
                      controller: _pwController,
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
                          borderSide:
                              BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.lock_outline_rounded),
                            color: Colors.grey),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        if (value.length < 8) {
                          return 'Password length must be 8 char or more';
                        }
                        return null;
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
                        _signIn();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',
                            style: TextStyle(
                                color: Color.fromARGB(255, 73, 71, 71),
                                fontSize: 16)),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUp()),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 16),
                          ),
                        ),
                      ],
                    )
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
