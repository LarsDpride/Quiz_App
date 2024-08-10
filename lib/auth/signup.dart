// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/auth/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void signUp() async {
    // print(_email);
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      // print('hello');
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        User? user = userCredential.user;
        if (user != null) {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(builder: (builder) => const LoginScreen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        print('Error signing up: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to sign up. Please try again.'),
          ),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 60.0),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: _inputDecoration(
                            context, 'Email', const Icon(Icons.email)),
                        validator: (value) =>
                            value!.isEmpty ? 'Email must be entered' : null,
                        onSaved: (newValue) => _email = newValue ?? '',
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: _inputDecoration(
                            context, 'Password', const Icon(Icons.password)),
                        obscureText: true,
                        validator: (value) =>
                            value!.isEmpty ? 'Password must be entered' : null,
                        onSaved: (newValue) => _password = newValue ?? '',
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: signUp,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        backgroundColor: Colors.purple,
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                const Center(child: Text("Or")),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/google.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          "Sign In with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.purple),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _inputDecoration(context, hinttext, icon) {
    return InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.purple.withOpacity(0.1),
        filled: true,
        prefixIcon: icon);
  }
}
