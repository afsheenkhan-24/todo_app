import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';
import 'package:todo/service/constants.dart';
import 'package:todo/database/supabase_handler.dart';
// import 'package:todo/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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


  void _signUp() async {
    await supabase.auth.signUp(
      email: _unController.text,
      password: _pwController.text,
      data: {
        'email': _unController.text.toLowerCase()
      }
    );
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
                    Image.asset('assets/sign_up.jpg'),
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
                        hintText: 'Confirm Password',
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
                              fontWeight: FontWeight.w600)
                          // minimumSize: const Size.fromWidth(double.infinity)
                          ),
                      onPressed: () {
                        _signUp();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?',
                            style: TextStyle(color: Color.fromARGB(255, 73, 71, 71), fontSize: 16)),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              _signUp();
                              Navigator.pop(context);
                            },
                            child: const Text('Login',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontSize: 16)))
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
