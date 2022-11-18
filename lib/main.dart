import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'screens/login_screen.dart';

void main() {
=======
import 'firebase_options.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
>>>>>>> ce4941eb2748439fffeb936973d724186eaf887b
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
=======
    return MaterialApp(
>>>>>>> ce4941eb2748439fffeb936973d724186eaf887b
      home: LoginScreen(),
    );
  }
}
