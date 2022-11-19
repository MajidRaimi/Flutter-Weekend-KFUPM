import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iau_flutter_weekend/screens/home_screen.dart';
import 'package:iau_flutter_weekend/screens/widgets/email_text_field.dart';
import 'package:iau_flutter_weekend/screens/widgets/main_button.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';
import '../constants/colors.dart';
import 'signup_screen.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? userCredential;
  bool isLoading = false;

  // Show error messages and user feedback
  void showsnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Sorry error ocurred!',
        message: text,
        contentType: ContentType.failure,
      ),
      duration: const Duration(seconds: 1, milliseconds: 500),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void toHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
  }

  void toSignUpScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignUpScreen();
        },
      ),
    );
  }

  // Login function
  Future<int> login() async {
    setState(() {
      isLoading = true;
    });
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      CollectionsRequests.currentUser = userCredential!.user;
      setState(() {
        isLoading = false;
      });
      return 0;
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        showsnackbar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showsnackbar(context, "Wrong password provided for that user.");
      } else {
        showsnackbar(context, e.code);
      }
      return 1;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(48),
                  child: SvgPicture.asset('assets/images/login.svg'),
                ),
              ),
              Form(
                key: formKey,
                child: Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      EmailTextField(
                        text: 'Email',
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(
                        text: 'Password',
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? SpinKitFadingCircle(
                              itemBuilder: (BuildContext context, int index) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    color:
                                        index.isEven ? kBlueColor : kGreenColor,
                                  ),
                                );
                              },
                            )
                          : MainButton(
                              text: 'Login',
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  if (await login() == 0) {
                                    toHomeScreen();
                                  }
                                }
                                // TODO : login with email and password
                                print(_passwordController.text);
                              },
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("don't have account ?"),
                          TextButton(
                            child: const Text("Create account"),
                            onPressed: () {
                              toSignUpScreen();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
