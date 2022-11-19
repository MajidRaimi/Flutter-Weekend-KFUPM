import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iau_flutter_weekend/screens/widgets/email_text_field.dart';
import 'package:iau_flutter_weekend/screens/widgets/password_text_field.dart';
import 'package:iau_flutter_weekend/services/collections_requests.dart';
import '../constants/colors.dart';
import 'on_boarding_screen.dart';
import 'widgets/main_button.dart';
import 'widgets/name_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  UserCredential? userCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

  void toOnBoarding() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const OnBoardingScreen();
    }));
  }

  Future<int> register() async {
    setState(() {
      isLoading = true;
    });
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Update additional information of user in collections
      _firestore.collection("users").doc(userCredential!.user!.uid).set(
        {
          "firstName": _firstNameController.text,
          "lastName": _lastNameController.text,
          "bookmark": [],
        },
      );
      CollectionsRequests.currentUser = userCredential!.user;
      setState(() {
        isLoading = false;
      });
      return 0;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showsnackbar(context, "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showsnackbar(context, "The account already exists for that email.");
      } else {
        showsnackbar(context, e.code);
      }
      setState(() {
        isLoading = false;
      });
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: kBlueColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: SvgPicture.asset('assets/images/signup.svg'),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: SizedBox(
                    width: 330,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NameTextField(
                                text: 'first name',
                                controller: _firstNameController,
                              ),
                              NameTextField(
                                text: 'last name',
                                controller: _lastNameController,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          EmailTextField(
                            text: 'email',
                            controller: _emailController,
                          ),
                          const SizedBox(height: 16),
                          PasswordTextField(
                            text: 'password',
                            controller: _passwordController,
                          ),
                          const SizedBox(height: 16),
                          isLoading
                              ? SpinKitFadingCircle(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: index.isEven
                                            ? kBlueColor
                                            : kGreenColor,
                                      ),
                                    );
                                  },
                                )
                              : MainButton(
                                  text: 'Register',
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (await register() == 0) {
                                        toOnBoarding();
                                      }
                                    }
                                  })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
    ;
  }
}
