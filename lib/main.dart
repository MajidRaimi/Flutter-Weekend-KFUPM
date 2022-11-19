import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'firebase_options.dart';
import 'screens/login_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF36a3c8,
            kBlueMaterialColor,
          ),
        ).copyWith(),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
