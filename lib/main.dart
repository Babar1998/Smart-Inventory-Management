import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
