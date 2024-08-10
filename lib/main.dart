import 'package:flutter/material.dart';
import 'package:howl_and_seek/presentations/launch_screen.dart';
import 'package:howl_and_seek/utils/custom_colors.dart';

void main() {
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
      home: const LaunchScreen(),
    );
  }
}