import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iau_flutter_weekend/screens/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

// Create login Page with username and password
class _LoginPage extends State<LoginPage> {
  // Variables
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  TextEditingController emailForm = TextEditingController();
  TextEditingController passwordForm = TextEditingController();

  // Show error messages and user feedback
  void showsnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Login function
  void login() async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: emailForm.text,
        password: passwordForm.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showsnackbar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showsnackbar(context, "Wrong password provided for that user.");
      }
    }
  }

  void toRegistrationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const RegistrationPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: emailForm,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your Email',
                  ),
                  // Validate Email using Regex
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    final RegExp nameExp = RegExp(
                        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
                    if (!nameExp.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordForm,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toggle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: const Text("Login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    toRegistrationPage();
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
