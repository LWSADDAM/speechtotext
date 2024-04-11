import 'package:flutter/material.dart';

import 'speechtotextscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SpeechToTextScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Speech to Text',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
