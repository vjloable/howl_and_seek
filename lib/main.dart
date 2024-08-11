import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';

import 'application/authentication_service.dart';
import 'firebase_options.dart';

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
      title: 'Howl & Seek',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColors.primaryAccent),
        useMaterial3: true,
      ),
      home: AuthenticationService.handleAuthState(),
    );
  }
}